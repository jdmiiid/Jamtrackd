// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'album_or_artist.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AlbumOrArtist _$AlbumOrArtistFromJson(Map<String, dynamic> json) {
  return _AlbumOrArtist.fromJson(json);
}

/// @nodoc
mixin _$AlbumOrArtist {
  String get id => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'release_date')
  String? get releaseDate => throw _privateConstructorUsedError;
  List<Artist>? get artists => throw _privateConstructorUsedError;
  List<dynamic>? get images => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AlbumOrArtistCopyWith<AlbumOrArtist> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlbumOrArtistCopyWith<$Res> {
  factory $AlbumOrArtistCopyWith(
          AlbumOrArtist value, $Res Function(AlbumOrArtist) then) =
      _$AlbumOrArtistCopyWithImpl<$Res, AlbumOrArtist>;
  @useResult
  $Res call(
      {String id,
      String type,
      String name,
      @JsonKey(name: 'release_date') String? releaseDate,
      List<Artist>? artists,
      List<dynamic>? images});
}

/// @nodoc
class _$AlbumOrArtistCopyWithImpl<$Res, $Val extends AlbumOrArtist>
    implements $AlbumOrArtistCopyWith<$Res> {
  _$AlbumOrArtistCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? name = null,
    Object? releaseDate = freezed,
    Object? artists = freezed,
    Object? images = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      releaseDate: freezed == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as String?,
      artists: freezed == artists
          ? _value.artists
          : artists // ignore: cast_nullable_to_non_nullable
              as List<Artist>?,
      images: freezed == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AlbumOrArtistImplCopyWith<$Res>
    implements $AlbumOrArtistCopyWith<$Res> {
  factory _$$AlbumOrArtistImplCopyWith(
          _$AlbumOrArtistImpl value, $Res Function(_$AlbumOrArtistImpl) then) =
      __$$AlbumOrArtistImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String type,
      String name,
      @JsonKey(name: 'release_date') String? releaseDate,
      List<Artist>? artists,
      List<dynamic>? images});
}

/// @nodoc
class __$$AlbumOrArtistImplCopyWithImpl<$Res>
    extends _$AlbumOrArtistCopyWithImpl<$Res, _$AlbumOrArtistImpl>
    implements _$$AlbumOrArtistImplCopyWith<$Res> {
  __$$AlbumOrArtistImplCopyWithImpl(
      _$AlbumOrArtistImpl _value, $Res Function(_$AlbumOrArtistImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? name = null,
    Object? releaseDate = freezed,
    Object? artists = freezed,
    Object? images = freezed,
  }) {
    return _then(_$AlbumOrArtistImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      releaseDate: freezed == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as String?,
      artists: freezed == artists
          ? _value._artists
          : artists // ignore: cast_nullable_to_non_nullable
              as List<Artist>?,
      images: freezed == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AlbumOrArtistImpl
    with DiagnosticableTreeMixin
    implements _AlbumOrArtist {
  const _$AlbumOrArtistImpl(
      {required this.id,
      required this.type,
      required this.name,
      @JsonKey(name: 'release_date') this.releaseDate,
      final List<Artist>? artists,
      final List<dynamic>? images})
      : _artists = artists,
        _images = images;

  factory _$AlbumOrArtistImpl.fromJson(Map<String, dynamic> json) =>
      _$$AlbumOrArtistImplFromJson(json);

  @override
  final String id;
  @override
  final String type;
  @override
  final String name;
  @override
  @JsonKey(name: 'release_date')
  final String? releaseDate;
  final List<Artist>? _artists;
  @override
  List<Artist>? get artists {
    final value = _artists;
    if (value == null) return null;
    if (_artists is EqualUnmodifiableListView) return _artists;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<dynamic>? _images;
  @override
  List<dynamic>? get images {
    final value = _images;
    if (value == null) return null;
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AlbumOrArtist(id: $id, type: $type, name: $name, releaseDate: $releaseDate, artists: $artists, images: $images)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AlbumOrArtist'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('type', type))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('releaseDate', releaseDate))
      ..add(DiagnosticsProperty('artists', artists))
      ..add(DiagnosticsProperty('images', images));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AlbumOrArtistImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.releaseDate, releaseDate) ||
                other.releaseDate == releaseDate) &&
            const DeepCollectionEquality().equals(other._artists, _artists) &&
            const DeepCollectionEquality().equals(other._images, _images));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      type,
      name,
      releaseDate,
      const DeepCollectionEquality().hash(_artists),
      const DeepCollectionEquality().hash(_images));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AlbumOrArtistImplCopyWith<_$AlbumOrArtistImpl> get copyWith =>
      __$$AlbumOrArtistImplCopyWithImpl<_$AlbumOrArtistImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AlbumOrArtistImplToJson(
      this,
    );
  }
}

abstract class _AlbumOrArtist implements AlbumOrArtist {
  const factory _AlbumOrArtist(
      {required final String id,
      required final String type,
      required final String name,
      @JsonKey(name: 'release_date') final String? releaseDate,
      final List<Artist>? artists,
      final List<dynamic>? images}) = _$AlbumOrArtistImpl;

  factory _AlbumOrArtist.fromJson(Map<String, dynamic> json) =
      _$AlbumOrArtistImpl.fromJson;

  @override
  String get id;
  @override
  String get type;
  @override
  String get name;
  @override
  @JsonKey(name: 'release_date')
  String? get releaseDate;
  @override
  List<Artist>? get artists;
  @override
  List<dynamic>? get images;
  @override
  @JsonKey(ignore: true)
  _$$AlbumOrArtistImplCopyWith<_$AlbumOrArtistImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
