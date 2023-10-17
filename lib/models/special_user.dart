import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'special_user.freezed.dart';
part 'special_user.g.dart';

@freezed
class SpecialUser with _$SpecialUser {
  const factory SpecialUser({
    String? username,
    String? bio,
    String? displayName,
    String? downloadURL,
    String? userID,
  }) = _SpecialUser;

  factory SpecialUser.fromJson(Map<String, dynamic> json) =>
      _$SpecialUserFromJson(json);

  static Map<String, Object?> toFirestore(specialUser, setOptions) =>
      specialUser.toJson();

  factory SpecialUser.fromFirestore(documentSnapshot, shapshotOptions) {
    final data = documentSnapshot.data() as Map<String, dynamic>;
    return SpecialUser(
      userID: documentSnapshot.id,
      username: data['username'],
      bio: data['bio'],
      displayName: data['displayName'],
      downloadURL: data['downloadURL'],
    );
  }
}
