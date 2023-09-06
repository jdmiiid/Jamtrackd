// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'album_review.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AlbumReview _$AlbumReviewFromJson(Map<String, dynamic> json) {
  return _AlbumReview.fromJson(json);
}

/// @nodoc
mixin _$AlbumReview {
  String get id => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  String get artistName => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  String get response => throw _privateConstructorUsedError;
  String? get releaseDate => throw _privateConstructorUsedError;
  List<String>? get tracks => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AlbumReviewCopyWith<AlbumReview> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlbumReviewCopyWith<$Res> {
  factory $AlbumReviewCopyWith(
          AlbumReview value, $Res Function(AlbumReview) then) =
      _$AlbumReviewCopyWithImpl<$Res, AlbumReview>;
  @useResult
  $Res call(
      {String id,
      String url,
      String artistName,
      double rating,
      String response,
      String? releaseDate,
      List<String>? tracks});
}

/// @nodoc
class _$AlbumReviewCopyWithImpl<$Res, $Val extends AlbumReview>
    implements $AlbumReviewCopyWith<$Res> {
  _$AlbumReviewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? url = null,
    Object? artistName = null,
    Object? rating = null,
    Object? response = null,
    Object? releaseDate = freezed,
    Object? tracks = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      artistName: null == artistName
          ? _value.artistName
          : artistName // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      response: null == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as String,
      releaseDate: freezed == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as String?,
      tracks: freezed == tracks
          ? _value.tracks
          : tracks // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AlbumReviewCopyWith<$Res>
    implements $AlbumReviewCopyWith<$Res> {
  factory _$$_AlbumReviewCopyWith(
          _$_AlbumReview value, $Res Function(_$_AlbumReview) then) =
      __$$_AlbumReviewCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String url,
      String artistName,
      double rating,
      String response,
      String? releaseDate,
      List<String>? tracks});
}

/// @nodoc
class __$$_AlbumReviewCopyWithImpl<$Res>
    extends _$AlbumReviewCopyWithImpl<$Res, _$_AlbumReview>
    implements _$$_AlbumReviewCopyWith<$Res> {
  __$$_AlbumReviewCopyWithImpl(
      _$_AlbumReview _value, $Res Function(_$_AlbumReview) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? url = null,
    Object? artistName = null,
    Object? rating = null,
    Object? response = null,
    Object? releaseDate = freezed,
    Object? tracks = freezed,
  }) {
    return _then(_$_AlbumReview(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      artistName: null == artistName
          ? _value.artistName
          : artistName // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      response: null == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as String,
      releaseDate: freezed == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as String?,
      tracks: freezed == tracks
          ? _value._tracks
          : tracks // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AlbumReview extends _AlbumReview {
  _$_AlbumReview(
      {required this.id,
      required this.url,
      required this.artistName,
      required this.rating,
      required this.response,
      required this.releaseDate,
      required final List<String>? tracks})
      : _tracks = tracks,
        super._();

  factory _$_AlbumReview.fromJson(Map<String, dynamic> json) =>
      _$$_AlbumReviewFromJson(json);

  @override
  final String id;
  @override
  final String url;
  @override
  final String artistName;
  @override
  final double rating;
  @override
  final String response;
  @override
  final String? releaseDate;
  final List<String>? _tracks;
  @override
  List<String>? get tracks {
    final value = _tracks;
    if (value == null) return null;
    if (_tracks is EqualUnmodifiableListView) return _tracks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'AlbumReview(id: $id, url: $url, artistName: $artistName, rating: $rating, response: $response, releaseDate: $releaseDate, tracks: $tracks)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AlbumReview &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.artistName, artistName) ||
                other.artistName == artistName) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.response, response) ||
                other.response == response) &&
            (identical(other.releaseDate, releaseDate) ||
                other.releaseDate == releaseDate) &&
            const DeepCollectionEquality().equals(other._tracks, _tracks));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, url, artistName, rating,
      response, releaseDate, const DeepCollectionEquality().hash(_tracks));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AlbumReviewCopyWith<_$_AlbumReview> get copyWith =>
      __$$_AlbumReviewCopyWithImpl<_$_AlbumReview>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AlbumReviewToJson(
      this,
    );
  }
}

abstract class _AlbumReview extends AlbumReview {
  factory _AlbumReview(
      {required final String id,
      required final String url,
      required final String artistName,
      required final double rating,
      required final String response,
      required final String? releaseDate,
      required final List<String>? tracks}) = _$_AlbumReview;
  _AlbumReview._() : super._();

  factory _AlbumReview.fromJson(Map<String, dynamic> json) =
      _$_AlbumReview.fromJson;

  @override
  String get id;
  @override
  String get url;
  @override
  String get artistName;
  @override
  double get rating;
  @override
  String get response;
  @override
  String? get releaseDate;
  @override
  List<String>? get tracks;
  @override
  @JsonKey(ignore: true)
  _$$_AlbumReviewCopyWith<_$_AlbumReview> get copyWith =>
      throw _privateConstructorUsedError;
}
