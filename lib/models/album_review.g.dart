// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AlbumReview _$$_AlbumReviewFromJson(Map<String, dynamic> json) =>
    _$_AlbumReview(
      id: json['id'] as String,
      url: json['url'] as String,
      artistName: json['artistName'] as String,
      rating: (json['rating'] as num).toDouble(),
      response: json['response'] as String,
      releaseDate: json['releaseDate'] as String?,
      tracks:
          (json['tracks'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_AlbumReviewToJson(_$_AlbumReview instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'artistName': instance.artistName,
      'rating': instance.rating,
      'response': instance.response,
      'releaseDate': instance.releaseDate,
      'tracks': instance.tracks,
    };
