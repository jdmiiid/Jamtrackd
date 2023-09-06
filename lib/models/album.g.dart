// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Album _$$_AlbumFromJson(Map<String, dynamic> json) => _$_Album(
      id: json['id'] as String,
      name: json['name'] as String,
      artists: (json['artists'] as List<dynamic>)
          .map((e) => Artist.fromJson(e as Map<String, dynamic>))
          .toList(),
      release_date: json['release_date'] as String?,
      images: json['images'] as List<dynamic>?,
    );

Map<String, dynamic> _$$_AlbumToJson(_$_Album instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'artists': instance.artists.map((e) => e.toJson()).toList(),
      'release_date': instance.release_date,
      'images': instance.images,
    };
