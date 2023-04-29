// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'album_image.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AlbumImage _$AlbumImageFromJson(Map<String, dynamic> json) {
  return _AlbumImage.fromJson(json);
}

/// @nodoc
mixin _$AlbumImage {
  bool get back => throw _privateConstructorUsedError;
  bool get approved => throw _privateConstructorUsedError;
  String get comment => throw _privateConstructorUsedError;
  bool get front => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  int get edit => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  Object get thumbnails => throw _privateConstructorUsedError;
  List<dynamic> get types => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AlbumImageCopyWith<AlbumImage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlbumImageCopyWith<$Res> {
  factory $AlbumImageCopyWith(
          AlbumImage value, $Res Function(AlbumImage) then) =
      _$AlbumImageCopyWithImpl<$Res, AlbumImage>;
  @useResult
  $Res call(
      {bool back,
      bool approved,
      String comment,
      bool front,
      String id,
      int edit,
      String image,
      Object thumbnails,
      List<dynamic> types});
}

/// @nodoc
class _$AlbumImageCopyWithImpl<$Res, $Val extends AlbumImage>
    implements $AlbumImageCopyWith<$Res> {
  _$AlbumImageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? back = null,
    Object? approved = null,
    Object? comment = null,
    Object? front = null,
    Object? id = null,
    Object? edit = null,
    Object? image = null,
    Object? thumbnails = null,
    Object? types = null,
  }) {
    return _then(_value.copyWith(
      back: null == back
          ? _value.back
          : back // ignore: cast_nullable_to_non_nullable
              as bool,
      approved: null == approved
          ? _value.approved
          : approved // ignore: cast_nullable_to_non_nullable
              as bool,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      front: null == front
          ? _value.front
          : front // ignore: cast_nullable_to_non_nullable
              as bool,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      edit: null == edit
          ? _value.edit
          : edit // ignore: cast_nullable_to_non_nullable
              as int,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnails: null == thumbnails ? _value.thumbnails : thumbnails,
      types: null == types
          ? _value.types
          : types // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AlbumImageCopyWith<$Res>
    implements $AlbumImageCopyWith<$Res> {
  factory _$$_AlbumImageCopyWith(
          _$_AlbumImage value, $Res Function(_$_AlbumImage) then) =
      __$$_AlbumImageCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool back,
      bool approved,
      String comment,
      bool front,
      String id,
      int edit,
      String image,
      Object thumbnails,
      List<dynamic> types});
}

/// @nodoc
class __$$_AlbumImageCopyWithImpl<$Res>
    extends _$AlbumImageCopyWithImpl<$Res, _$_AlbumImage>
    implements _$$_AlbumImageCopyWith<$Res> {
  __$$_AlbumImageCopyWithImpl(
      _$_AlbumImage _value, $Res Function(_$_AlbumImage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? back = null,
    Object? approved = null,
    Object? comment = null,
    Object? front = null,
    Object? id = null,
    Object? edit = null,
    Object? image = null,
    Object? thumbnails = null,
    Object? types = null,
  }) {
    return _then(_$_AlbumImage(
      back: null == back
          ? _value.back
          : back // ignore: cast_nullable_to_non_nullable
              as bool,
      approved: null == approved
          ? _value.approved
          : approved // ignore: cast_nullable_to_non_nullable
              as bool,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      front: null == front
          ? _value.front
          : front // ignore: cast_nullable_to_non_nullable
              as bool,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      edit: null == edit
          ? _value.edit
          : edit // ignore: cast_nullable_to_non_nullable
              as int,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnails: null == thumbnails ? _value.thumbnails : thumbnails,
      types: null == types
          ? _value._types
          : types // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AlbumImage with DiagnosticableTreeMixin implements _AlbumImage {
  const _$_AlbumImage(
      {required this.back,
      required this.approved,
      required this.comment,
      required this.front,
      required this.id,
      required this.edit,
      required this.image,
      required this.thumbnails,
      required final List<dynamic> types})
      : _types = types;

  factory _$_AlbumImage.fromJson(Map<String, dynamic> json) =>
      _$$_AlbumImageFromJson(json);

  @override
  final bool back;
  @override
  final bool approved;
  @override
  final String comment;
  @override
  final bool front;
  @override
  final String id;
  @override
  final int edit;
  @override
  final String image;
  @override
  final Object thumbnails;
  final List<dynamic> _types;
  @override
  List<dynamic> get types {
    if (_types is EqualUnmodifiableListView) return _types;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_types);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AlbumImage(back: $back, approved: $approved, comment: $comment, front: $front, id: $id, edit: $edit, image: $image, thumbnails: $thumbnails, types: $types)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AlbumImage'))
      ..add(DiagnosticsProperty('back', back))
      ..add(DiagnosticsProperty('approved', approved))
      ..add(DiagnosticsProperty('comment', comment))
      ..add(DiagnosticsProperty('front', front))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('edit', edit))
      ..add(DiagnosticsProperty('image', image))
      ..add(DiagnosticsProperty('thumbnails', thumbnails))
      ..add(DiagnosticsProperty('types', types));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AlbumImage &&
            (identical(other.back, back) || other.back == back) &&
            (identical(other.approved, approved) ||
                other.approved == approved) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.front, front) || other.front == front) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.edit, edit) || other.edit == edit) &&
            (identical(other.image, image) || other.image == image) &&
            const DeepCollectionEquality()
                .equals(other.thumbnails, thumbnails) &&
            const DeepCollectionEquality().equals(other._types, _types));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      back,
      approved,
      comment,
      front,
      id,
      edit,
      image,
      const DeepCollectionEquality().hash(thumbnails),
      const DeepCollectionEquality().hash(_types));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AlbumImageCopyWith<_$_AlbumImage> get copyWith =>
      __$$_AlbumImageCopyWithImpl<_$_AlbumImage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AlbumImageToJson(
      this,
    );
  }
}

abstract class _AlbumImage implements AlbumImage {
  const factory _AlbumImage(
      {required final bool back,
      required final bool approved,
      required final String comment,
      required final bool front,
      required final String id,
      required final int edit,
      required final String image,
      required final Object thumbnails,
      required final List<dynamic> types}) = _$_AlbumImage;

  factory _AlbumImage.fromJson(Map<String, dynamic> json) =
      _$_AlbumImage.fromJson;

  @override
  bool get back;
  @override
  bool get approved;
  @override
  String get comment;
  @override
  bool get front;
  @override
  String get id;
  @override
  int get edit;
  @override
  String get image;
  @override
  Object get thumbnails;
  @override
  List<dynamic> get types;
  @override
  @JsonKey(ignore: true)
  _$$_AlbumImageCopyWith<_$_AlbumImage> get copyWith =>
      throw _privateConstructorUsedError;
}
