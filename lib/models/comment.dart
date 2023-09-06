import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment.freezed.dart';
// optional: Since our ReleaseGroup class is serializable, we must add this line.
// But if ReleaseGroup was not serializable, we could skip it.
part 'comment.g.dart';

@freezed
class Comment with _$Comment {
  const factory Comment(
      {required String text,
      required String timestamp,
      required String userId,
      required String? username,
      required String? pPicURL,
      required String commentID,
      required List<Comment>? subComments}) = _Comment;

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);

  factory Comment.fromFirestore(documentSnapshot, shapshotOptions) {
    print(documentSnapshot.data());
    final data = documentSnapshot.data() as Map<String, dynamic>;
    return Comment(
        commentID: documentSnapshot.id,
        text: data['text'],
        timestamp: data['timestamp'],
        userId: data['userId'],
        username: data['username'],
        pPicURL: data['pPicUrl'],
        subComments: data['sucComments']);
  }

  static Map<String, Object?> toFirestore(comment, setOptions) =>
      comment.toJson();
}
