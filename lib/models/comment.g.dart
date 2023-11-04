// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommentImpl _$$CommentImplFromJson(Map<String, dynamic> json) =>
    _$CommentImpl(
      text: json['text'] as String,
      timestamp: json['timestamp'] as String,
      userId: json['userId'] as String,
      username: json['username'] as String?,
      pPicUrl: json['pPicUrl'] as String?,
      commentID: json['commentID'] as String,
    );

Map<String, dynamic> _$$CommentImplToJson(_$CommentImpl instance) =>
    <String, dynamic>{
      'text': instance.text,
      'timestamp': instance.timestamp,
      'userId': instance.userId,
      'username': instance.username,
      'pPicUrl': instance.pPicUrl,
      'commentID': instance.commentID,
    };
