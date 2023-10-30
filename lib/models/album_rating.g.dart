// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_rating.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AlbumRating _$$_AlbumRatingFromJson(Map<String, dynamic> json) =>
    _$_AlbumRating(
      artistName: json['artistName'] as String,
      albumName: json['albumName'] as String,
      title: json['title'] as String?,
      rating: (json['rating'] as num).toDouble(),
      response: json['response'] as String,
      url: json['url'] as String,
      releaseDate: json['releaseDate'] as String,
      favoriteTrack: json['favoriteTrack'] as String,
    );

Map<String, dynamic> _$$_AlbumRatingToJson(_$_AlbumRating instance) =>
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
