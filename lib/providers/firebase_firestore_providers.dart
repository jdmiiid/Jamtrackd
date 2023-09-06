import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tasktrack/providers/firebase_auth_providers.dart';

import '../models/comment.dart';
import '../models/post.dart';

part 'firebase_firestore_providers.g.dart';

final reviewLookProvider = StateProvider<Post?>((ref) => null);

final rLookNeedsSetUpProvider = StateProvider<bool>((ref) => true);

CollectionReference getUsersCollectionRef() {
  return FirebaseFirestore.instance.collection('users');
}

CollectionReference getPostsCollectionRef() {
  return FirebaseFirestore.instance.collection('posts');
}

// Reusable function to retrieve a user's following list
@riverpod
Future<List<String>> retrieveFollowingList(RetrieveFollowingListRef ref) async {
  final userID = ref.watch(firebaseAuthCurrentUserProvider)!.uid;

  final followingCollectionRef =
      getUsersCollectionRef().doc(userID).collection('following');
  final querySnapshot = await followingCollectionRef.get();

  return querySnapshot.docs.map((doc) => doc.id).toList();
}

// Reusable function to retrieve posts based on a query
Future<List<Post>> retrievePosts(Query<Post> query) async {
  final querySnapshot = await query.get();
  return querySnapshot.docs.map((doc) => doc.data()).toList();
}

// Reusable function to retrieve comments based on a query
Future<List<Comment>> retrieveCommentList(Query<Comment> query) async {
  final querySnapshot = await query.get();
  return querySnapshot.docs.map((doc) => doc.data()).toList();
}

// Reusable function to retrieve comments based on a query
Future<List<String>> retrievePostLikeList(Query query) async {
  final querySnapshot = await query.get();
  return querySnapshot.docs.map((doc) => doc.id).toList();
}

// Reusable function to retrieve comments based on a query
Future<List<String>> retrieveCommentLikeList(Query query) async {
  final querySnapshot = await query.get();
  return querySnapshot.docs.map((doc) => doc.id).toList();
}

@riverpod
FirebaseFirestore firebaseFirestoreInstance(FirebaseFirestoreInstanceRef ref) {
  return FirebaseFirestore.instance;
}

@riverpod
Future<String> retrieveUsername(RetrieveUsernameRef ref) async {
  final userID = ref.watch(firebaseAuthCurrentUserProvider)!.uid;
  final documentSnapshot = await getUsersCollectionRef().doc(userID).get();
  return documentSnapshot['username'];
}

class UpdatedPostsNotifier extends StateNotifier<List<Post>> {
  UpdatedPostsNotifier() : super([]);

  Future<void> _fetchPosts(
      List<String> followedUserIds, int limit, WidgetRef ref,
      {bool isInitial = false}) async {
    final query = getPostsCollectionRef()
        .where('author', whereIn: followedUserIds)
        .orderBy('timestamp', descending: true)
        .limit(limit)
        .withConverter<Post>(
          fromFirestore: (snapshot, _) => Post.fromFirestore(snapshot, _),
          toFirestore: (post, _) => Post.toFirestore(post, _),
        );

    final newPosts = isInitial
        ? await retrievePosts(query)
        : await retrievePosts(query.startAfter([state.last.timestamp]));

    if (newPosts.length < limit) {
      ref.read(hasMorePostsProvider.notifier).state = false;
    }

    if (isInitial) {
      ref.read(hasMorePostsProvider.notifier).state = true;
      state = newPosts;
    } else {
      final currentList = state + newPosts;
      state = currentList;
    }
  }

  Future<void> fetchPosts(
      List<String> followedUserIds, int limit, WidgetRef ref,
      {bool isInitial = false}) async {
    await _fetchPosts(followedUserIds, limit, ref, isInitial: isInitial);
    if (isInitial) {
      print('initialpostsused');
    } else {
      print('morepostsused');
    }
  }
}

final stateNotifierPostList =
    StateNotifierProvider<UpdatedPostsNotifier, List<Post>>(
        (ref) => UpdatedPostsNotifier());

final hasMorePostsProvider = StateProvider<bool>((ref) => true);

// For comments

final hasMoreCommentsProvider = StateProvider<bool>((ref) => true);

class UpdatedCommentsNotifier extends StateNotifier<List<Comment>> {
  UpdatedCommentsNotifier() : super([]);

  Future<void> _fetchComments(
    int limit,
    WidgetRef ref,
    String postId, {
    bool isInitial = false,
  }) async {
    final query = getPostsCollectionRef()
        .doc(postId)
        .collection('comments')
        .orderBy('timestamp', descending: true)
        .limit(7)
        .withConverter<Comment>(
          fromFirestore: (snapshot, _) => Comment.fromFirestore(snapshot, _),
          toFirestore: (comment, _) => Comment.toFirestore(comment, _),
        );

    final newComments = isInitial
        ? await retrieveCommentList(query)
        : await retrieveCommentList(query.startAfter([state.last.timestamp]));

    if (newComments.length < limit) {
      ref.read(hasMoreCommentsProvider.notifier).state = false;
    }

    if (isInitial) {
      ref.read(hasMoreCommentsProvider.notifier).state = true;
      state = newComments;
    } else {
      final currentList = state + newComments;
      state = currentList;
    }
  }

  Future<void> fetchComments(
    int limit,
    WidgetRef ref,
    String postId, {
    bool isInitial = false,
  }) async {
    await _fetchComments(limit, ref, postId, isInitial: isInitial);
    if (isInitial) {
      print('initial comments used');
    } else {
      print('more comments used');
    }
  }
}

final stateNotifierCommentsList =
    StateNotifierProvider<UpdatedCommentsNotifier, List<Comment>>(
  (ref) => UpdatedCommentsNotifier(),
);

Future<void> createCommentDoc(
    {required String postId, required Comment newComment}) async {
  final firestoreCollection = FirebaseFirestore.instance
      .collection('posts')
      .doc(postId)
      .collection('comments')
      .withConverter<Comment>(
        fromFirestore: Comment.fromFirestore,
        toFirestore: Comment.toFirestore,
      );
  await firestoreCollection.doc().set(newComment);
}

// For likes
class UpdatedPostLikesNotifier extends StateNotifier<List<String>> {
  UpdatedPostLikesNotifier() : super([]);

  Future<void> _fetchPostLikes(String postId) async {
    final query = getPostsCollectionRef().doc(postId).collection('postLikes');

    state = await retrievePostLikeList(query);
  }

  Future<void> fetchPostLikes(String postId) async {
    await _fetchPostLikes(postId);
  }
}

final stateNotifierPostLikesList =
    StateNotifierProvider<UpdatedPostLikesNotifier, List<String>>(
  (ref) => UpdatedPostLikesNotifier(),
);

// For likes list
class UpdatedCommentLikesNotifier extends StateNotifier<List<String>> {
  UpdatedCommentLikesNotifier() : super([]);

  Future<void> _fetchCommentLikes(String commentId) async {
    final query =
        getPostsCollectionRef().doc(commentId).collection('commentLikes');

    state = await retrieveCommentLikeList(query);
  }

  Future<void> fetchCommentLikes(String commentId) async {
    await _fetchCommentLikes(commentId);
  }
}

final stateNotifierCommentLikesList =
    StateNotifierProvider<UpdatedCommentLikesNotifier, List<String>>(
  (ref) => UpdatedCommentLikesNotifier(),
);

// For likes count
@riverpod
Future<int> commentLikeInt(
    CommentLikeIntRef ref, String postId, String commentId) async {
  final querySnapshot = await getPostsCollectionRef()
      .doc(postId)
      .collection('comments')
      .doc(commentId)
      .collection('commentLikes')
      .get();

  return querySnapshot.size;
}
