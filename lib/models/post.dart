import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'album_rating.dart';

part 'post.freezed.dart';
part 'post.g.dart';

@freezed
class Post with _$Post {
  const factory Post({
    required String postID,
    required String author,
    required String username,
    required AlbumRating content,
    required String timestamp,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  factory Post.fromFirestore(documentSnapshot, shapshotOptions) {
    print(documentSnapshot.data());
    final data = documentSnapshot.data() as Map<String, dynamic>;
    return Post(
      postID: documentSnapshot.id,
      author: data['author'],
      content: AlbumRating.fromJson(data['content']),
      timestamp: data['timestamp'],
      username: data['username'],
    );
  }

  static Map<String, Object?> toFirestore(post, setOptions) => post.toJson();

  static Future<DocumentReference<Post>> createFirestorePost({
    required String albId,
    required Post albumPost,
  }) async {
    final firestoreCollection = FirebaseFirestore.instance
        .collection('posts')
        .withConverter(
            fromFirestore: Post.fromFirestore, toFirestore: toFirestore)
        .doc(albId);

    await firestoreCollection.set(albumPost);
    return firestoreCollection;
  }
}
