// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_rating.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AlbumRatingImpl _$$AlbumRatingImplFromJson(Map<String, dynamic> json) =>
    _$AlbumRatingImpl(
      artistName: json['artistName'] as String,
      albumName: json['albumName'] as String,
      title: json['title'] as String?,
      rating: (json['rating'] as num).toDouble(),
      response: json['response'] as String,
      url: json['url'] as String,
      releaseDate: json['releaseDate'] as String,
      favoriteTrack: json['favoriteTrack'] as String,
    );

Map<String, dynamic> _$$AlbumRatingImplToJson(_$AlbumRatingImpl instance) =>
    <String, dynamic>{
      'artistName': instance.artistName,
      'albumName': instance.albumName,
      'title': instance.title,
      'rating': instance.rating,
      'response': instance.response,
      'url': instance.url,
      'releaseDate': instance.releaseDate,
      'favoriteTrack': instance.favoriteTrack,
    };
