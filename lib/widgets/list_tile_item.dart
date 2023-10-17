import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tasktrack/models/comment.dart';
import 'package:tasktrack/providers/firebase_auth_providers.dart';
import 'package:tasktrack/providers/firebase_firestore_providers.dart';

import '../models/post.dart';

class CommentListTileItem extends ConsumerStatefulWidget {
  const CommentListTileItem({
    required this.likeCount,
    required this.indexedComment,
    required this.liked,
    Key? key,
  }) : super(key: key);

  final int likeCount;
  final Comment indexedComment;
  final bool liked;

  @override
  _CommentListTileItemState createState() => _CommentListTileItemState();
}

class _CommentListTileItemState extends ConsumerState<CommentListTileItem> {
  late int _itemCount;

  @override
  void initState() {
    super.initState();
    _itemCount = widget.liked ? 1 : 0;
  }

  @override
  Widget build(BuildContext context) {
    final originalCommentDateString = widget.indexedComment.timestamp;
    final originalCommentDate = DateTime.parse(originalCommentDateString);
    final dif = DateTime.now().difference(originalCommentDate);
    final timeAgo = _calculateTimeAgo(dif);

    return ListTile(
      leading: CircleAvatar(
        foregroundImage: CachedNetworkImageProvider(
          widget.indexedComment.pPicUrl!,
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCommentText(timeAgo),
          const SizedBox(height: 4),
          Row(
            children: [
              Expanded(
                flex: 3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(timeAgo),
                    Text('${_itemCount + widget.likeCount} likes'),
                    const Text('Reply'),
                  ],
                ),
              ),
              const Expanded(
                flex: 4,
                child: SizedBox(),
              ),
            ],
          ),
        ],
      ),
      trailing: _buildTrailingWidget(context),
      horizontalTitleGap: 7,
      contentPadding: const EdgeInsets.only(right: 4),
      dense: true,
    );
  }

  String _calculateTimeAgo(Duration dif) {
    if (dif.inDays > 364) {
      return '${(dif.inDays / 365).floor()}y';
    } else if (dif.inDays > 6) {
      return '${(dif.inDays / 7).floor()}w';
    } else if (dif.inHours > 23) {
      return '${dif.inDays}d';
    } else if (dif.inHours > 0) {
      return '${dif.inHours}h';
    } else {
      return '${dif.inMinutes}m';
    }
  }

  Widget _buildCommentText(String timeAgo) {
    return RichText(
      text: TextSpan(
        recognizer: TapGestureRecognizer()
          ..onTap = () => print('you clicked username'),
        text: widget.indexedComment.username ?? 'Username',
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
        children: [
          TextSpan(
            text: ' ${widget.indexedComment.text}',
            style: const TextStyle(
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTrailingWidget(BuildContext context) {
    final userID = ref.watch(firebaseAuthCurrentUserProvider)!.uid;
    final postID = ref.watch(reviewLookProvider)!.postID;
    return FittedBox(
      child: IconButton(
        onPressed: () {
          setState(() {
            if (_itemCount > 0) {
              print('Deleting...');
              _itemCount--;
              deleteFirestoreCommentLike(
                userId: userID,
                postId: postID,
                commentId: widget.indexedComment.commentID,
              );
            } else {
              print('Adding...');
              _itemCount++;
              addFirestoreCommentLike(
                userId: userID,
                postId: postID,
                commentId: widget.indexedComment.commentID,
              );
            }
          });
        },
        icon: _itemCount > 0
            ? const Icon(Icons.favorite, size: 16)
            : const Icon(Icons.favorite_border_outlined, size: 16),
      ),
    );
  }
}

class PostLikeButton extends ConsumerStatefulWidget {
  const PostLikeButton({
    required this.postLikeCount,
    required this.indexedPostData,
    required this.liked,
    Key? key,
  }) : super(key: key);

  final int postLikeCount;
  final Post indexedPostData;
  final bool liked;

  @override
  PostLikeButtonState createState() => PostLikeButtonState();
}

class PostLikeButtonState extends ConsumerState<PostLikeButton> {
  int _itemCount = 0;
  late int _likeState;

  @override
  void initState() {
    _likeState = widget.liked ? 1 : 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userID = ref.watch(firebaseAuthCurrentUserProvider)!.uid;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '${widget.indexedPostData.content.rating.toString()} | ${widget.postLikeCount + _itemCount} ',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        ),
        GestureDetector(
          onTap: () => setState(() {
            if (_likeState > 0) {
              print('Deleting...');
              _itemCount--;
              _likeState--;
              deleteFirestorePostLike(
                userId: userID,
                postId: widget.indexedPostData.postID,
              );
            } else {
              print('Adding...');
              _itemCount++;
              _likeState++;
              addFirestorePostLike(
                userId: userID,
                postId: widget.indexedPostData.postID,
              );
            }
          }),
          child: _likeState > 0
              ? Icon(
                  Icons.favorite,
                )
              : Icon(
                  Icons.favorite_border_outlined,
                ),
        ),
      ],
    );
  }
}
