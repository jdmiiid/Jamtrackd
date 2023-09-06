// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      displayName: json['displayName'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      emailVerified: json['emailVerified'] as bool,
      isAnonymous: json['isAnonymous'] as bool,
      phoneNumber: json['phoneNumber'] as String,
      photoURL: json['photoURL'] as String,
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'displayName': instance.displayName,
      'username': instance.username,
      'email': instance.email,
      'emailVerified': instance.emailVerified,
      'isAnonymous': instance.isAnonymous,
      'phoneNumber': instance.phoneNumber,
      'photoURL': instance.photoURL,
    };
