// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'special_user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SpecialUserDataImpl _$$SpecialUserDataImplFromJson(
        Map<String, dynamic> json) =>
    _$SpecialUserDataImpl(
      username: json['username'] as String,
      bio: json['bio'] as String?,
      userID: json['userID'] as String?,
      displayName: json['displayName'] as String?,
      photoURL: json['photoURL'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$$SpecialUserDataImplToJson(
        _$SpecialUserDataImpl instance) =>
    <String, dynamic>{
      'username': instance.username,
      'bio': instance.bio,
      'userID': instance.userID,
      'displayName': instance.displayName,
      'photoURL': instance.photoURL,
      'email': instance.email,
    };
