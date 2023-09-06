// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Comment _$$_CommentFromJson(Map<String, dynamic> json) => _$_Comment(
      text: json['text'] as String,
      timestamp: json['timestamp'] as String,
      userId: json['userId'] as String,
      username: json['username'] as String?,
      pPicURL: json['pPicURL'] as String?,
      commentID: json['commentID'] as String,
      subComments: (json['subComments'] as List<dynamic>?)
          ?.map((e) => Comment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_CommentToJson(_$_Comment instance) =>
    <String, dynamic>{
      'text': instance.text,
      'timestamp': instance.timestamp,
      'userId': instance.userId,
      'username': instance.username,
      'pPicURL': instance.pPicURL,
      'commentID': instance.commentID,
      'subComments': instance.subComments?.map((e) => e.toJson()).toList(),
    };
