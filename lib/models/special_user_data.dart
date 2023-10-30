import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'special_user_data.freezed.dart';
part 'special_user_data.g.dart';

@freezed
class SpecialUserData with _$SpecialUserData {
  const factory SpecialUserData({
    String? username,
    String? bio,
    String? userID,
    String? displayName,
    String? photoURL,
  }) = _SpecialUserData;

  factory SpecialUserData.fromJson(Map<String, dynamic> json) =>
      _$SpecialUserDataFromJson(json);

  static Map<String, Object?> toFirestore(specialUserData, setOptions) =>
      specialUserData.toJson();

  factory SpecialUserData.fromFirestore(documentSnapshot, shapshotOptions) {
    final data = documentSnapshot.data() as Map<String, dynamic>;
    return SpecialUserData(
      userID: documentSnapshot.id,
      username: data['username'],
      bio: data['bio'],
      displayName: data['displayName'],
      photoURL: data['photoURL'],
    );
  }
}
