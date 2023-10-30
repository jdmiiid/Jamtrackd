// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'album_rating.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AlbumRating _$AlbumRatingFromJson(Map<String, dynamic> json) {
  return _AlbumRating.fromJson(json);
}

/// @nodoc
mixin _$AlbumRating {
  String get artistName => throw _privateConstructorUsedError;
  String get albumName => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  String get response => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  String get releaseDate => throw _privateConstructorUsedError;
  String get favoriteTrack => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AlbumRatingCopyWith<AlbumRating> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlbumRatingCopyWith<$Res> {
  factory $AlbumRatingCopyWith(
          AlbumRating value, $Res Function(AlbumRating) then) =
      _$AlbumRatingCopyWithImpl<$Res, AlbumRating>;
  @useResult
  $Res call(
      {String artistName,
      String albumName,
      String? title,
      double rating,
      String response,
      String url,
      String releaseDate,
      String favoriteTrack});
}

/// @nodoc
class _$AlbumRatingCopyWithImpl<$Res, $Val extends AlbumRating>
    implements $AlbumRatingCopyWith<$Res> {
  _$AlbumRatingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? artistName = null,
    Object? albumName = null,
    Object? title = freezed,
    Object? rating = null,
    Object? response = null,
    Object? url = null,
    Object? releaseDate = null,
    Object? favoriteTrack = null,
  }) {
    return _then(_value.copyWith(
      artistName: null == artistName
          ? _value.artistName
          : artistName // ignore: cast_nullable_to_non_nullable
              as String,
      albumName: null == albumName
          ? _value.albumName
          : albumName // ignore: cast_nullable_to_non_nullable
              as String,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      response: null == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      releaseDate: null == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as String,
      favoriteTrack: null == favoriteTrack
          ? _value.favoriteTrack
          : favoriteTrack // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AlbumRatingCopyWith<$Res>
    implements $AlbumRatingCopyWith<$Res> {
  factory _$$_AlbumRatingCopyWith(
          _$_AlbumRating value, $Res Function(_$_AlbumRating) then) =
      __$$_AlbumRatingCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String artistName,
      String albumName,
      String? title,
      double rating,
      String response,
      String url,
      String releaseDate,
      String favoriteTrack});
}

/// @nodoc
class __$$_AlbumRatingCopyWithImpl<$Res>
    extends _$AlbumRatingCopyWithImpl<$Res, _$_AlbumRating>
    implements _$$_AlbumRatingCopyWith<$Res> {
  __$$_AlbumRatingCopyWithImpl(
      _$_AlbumRating _value, $Res Function(_$_AlbumRating) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? artistName = null,
    Object? albumName = null,
    Object? title = freezed,
    Object? rating = null,
    Object? response = null,
    Object? url = null,
    Object? releaseDate = null,
    Object? favoriteTrack = null,
  }) {
    return _then(_$_AlbumRating(
      artistName: null == artistName
          ? _value.artistName
          : artistName // ignore: cast_nullable_to_non_nullable
              as String,
      albumName: null == albumName
          ? _value.albumName
          : albumName // ignore: cast_nullable_to_non_nullable
              as String,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      response: null == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      releaseDate: null == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as String,
      favoriteTrack: null == favoriteTrack
          ? _value.favoriteTrack
          : favoriteTrack // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AlbumRating extends _AlbumRating {
  _$_AlbumRating(
      {required this.artistName,
      required this.albumName,
      required this.title,
      required this.rating,
      required this.response,
      required this.url,
      required this.releaseDate,
      required this.favoriteTrack})
      : super._();

  factory _$_AlbumRating.fromJson(Map<String, dynamic> json) =>
      _$$_AlbumRatingFromJson(json);

  @override
  final String artistName;
  @override
  final String albumName;
  @override
  final String? title;
  @override
  final double rating;
  @override
  final String response;
  @override
  final String url;
  @override
  final String releaseDate;
  @override
  final String favoriteTrack;

  @override
  String toString() {
    return 'AlbumRating(artistName: $artistName, albumName: $albumName, title: $title, rating: $rating, response: $response, url: $url, releaseDate: $releaseDate, favoriteTrack: $favoriteTrack)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AlbumRating &&
            (identical(other.artistName, artistName) ||
                other.artistName == artistName) &&
            (identical(other.albumName, albumName) ||
                other.albumName == albumName) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.response, response) ||
                other.response == response) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.releaseDate, releaseDate) ||
                other.releaseDate == releaseDate) &&
            (identical(other.favoriteTrack, favoriteTrack) ||
                other.favoriteTrack == favoriteTrack));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, artistName, albumName, title,
      rating, response, url, releaseDate, favoriteTrack);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AlbumRatingCopyWith<_$_AlbumRating> get copyWith =>
      __$$_AlbumRatingCopyWithImpl<_$_AlbumRating>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AlbumRatingToJson(
      this,
    );
  }
}

abstract class _AlbumRating extends AlbumRating {
  factory _AlbumRating(
      {required final String artistName,
      required final String albumName,
      required final String? title,
      required final double rating,
      required final String response,
      required final String url,
      required final String releaseDate,
      required final String favoriteTrack}) = _$_AlbumRating;
  _AlbumRating._() : super._();

  factory _AlbumRating.fromJson(Map<String, dynamic> json) =
      _$_AlbumRating.fromJson;

  @override
  String get artistName;
  @override
  String get albumName;
  @override
  String? get title;
  @override
  double get rating;
  @override
  String get response;
  @override
  String get url;
  @override
  String get releaseDate;
  @override
  String get favoriteTrack;
  @override
  @JsonKey(ignore: true)
  _$$_AlbumRatingCopyWith<_$_AlbumRating> get copyWith =>
      throw _privateConstructorUsedError;
}
