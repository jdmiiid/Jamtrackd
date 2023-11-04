// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_or_artist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AlbumOrArtistImpl _$$AlbumOrArtistImplFromJson(Map<String, dynamic> json) =>
    _$AlbumOrArtistImpl(
      id: json['id'] as String,
      type: json['type'] as String,
      name: json['name'] as String,
      releaseDate: json['release_date'] as String?,
      artists: (json['artists'] as List<dynamic>?)
          ?.map((e) => Artist.fromJson(e as Map<String, dynamic>))
          .toList(),
      images: json['images'] as List<dynamic>?,
    );

Map<String, dynamic> _$$AlbumOrArtistImplToJson(_$AlbumOrArtistImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'name': instance.name,
      'release_date': instance.releaseDate,
      'artists': instance.artists?.map((e) => e.toJson()).toList(),
      'images': instance.images,
    };
