// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AlbumImage _$$_AlbumImageFromJson(Map<String, dynamic> json) =>
    _$_AlbumImage(
      back: json['back'] as bool,
      approved: json['approved'] as bool,
      comment: json['comment'] as String,
      front: json['front'] as bool,
      id: json['id'] as String,
      edit: json['edit'] as int,
      image: json['image'] as String,
      thumbnails: json['thumbnails'] as Object,
      types: json['types'] as List<dynamic>,
    );

Map<String, dynamic> _$$_AlbumImageToJson(_$_AlbumImage instance) =>
    <String, dynamic>{
      'back': instance.back,
      'approved': instance.approved,
      'comment': instance.comment,
      'front': instance.front,
      'id': instance.id,
      'edit': instance.edit,
      'image': instance.image,
      'thumbnails': instance.thumbnails,
      'types': instance.types,
    };
