// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostImpl _$$PostImplFromJson(Map<String, dynamic> json) => _$PostImpl(
      postID: json['postID'] as String,
      author: json['author'] as String,
      username: json['username'] as String,
      content: AlbumRating.fromJson(json['content']),
      timestamp: json['timestamp'] as String,
      likes: json['likes'] as List<dynamic>,
      downloadURL: json['downloadURL'] as String?,
    );

Map<String, dynamic> _$$PostImplToJson(_$PostImpl instance) =>
    <String, dynamic>{
      'postID': instance.postID,
      'author': instance.author,
      'username': instance.username,
      'content': instance.content.toJson(),
      'timestamp': instance.timestamp,
      'likes': instance.likes,
      'downloadURL': instance.downloadURL,
    };
