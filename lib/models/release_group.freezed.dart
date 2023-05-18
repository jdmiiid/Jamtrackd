// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'release_group.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReleaseGroup _$ReleaseGroupFromJson(Map<String, dynamic> json) {
  return _ReleaseGroup.fromJson(json);
}

/// @nodoc
mixin _$ReleaseGroup {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReleaseGroupCopyWith<ReleaseGroup> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReleaseGroupCopyWith<$Res> {
  factory $ReleaseGroupCopyWith(
          ReleaseGroup value, $Res Function(ReleaseGroup) then) =
      _$ReleaseGroupCopyWithImpl<$Res, ReleaseGroup>;
  @useResult
  $Res call({String id, String title});
}

/// @nodoc
class _$ReleaseGroupCopyWithImpl<$Res, $Val extends ReleaseGroup>
    implements $ReleaseGroupCopyWith<$Res> {
  _$ReleaseGroupCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReleaseGroupCopyWith<$Res>
    implements $ReleaseGroupCopyWith<$Res> {
  factory _$$_ReleaseGroupCopyWith(
          _$_ReleaseGroup value, $Res Function(_$_ReleaseGroup) then) =
      __$$_ReleaseGroupCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String title});
}

/// @nodoc
class __$$_ReleaseGroupCopyWithImpl<$Res>
    extends _$ReleaseGroupCopyWithImpl<$Res, _$_ReleaseGroup>
    implements _$$_ReleaseGroupCopyWith<$Res> {
  __$$_ReleaseGroupCopyWithImpl(
      _$_ReleaseGroup _value, $Res Function(_$_ReleaseGroup) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
  }) {
    return _then(_$_ReleaseGroup(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReleaseGroup with DiagnosticableTreeMixin implements _ReleaseGroup {
  const _$_ReleaseGroup({required this.id, required this.title});

  factory _$_ReleaseGroup.fromJson(Map<String, dynamic> json) =>
      _$$_ReleaseGroupFromJson(json);

  @override
  final String id;
  @override
  final String title;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ReleaseGroup(id: $id, title: $title)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ReleaseGroup'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('title', title));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReleaseGroup &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReleaseGroupCopyWith<_$_ReleaseGroup> get copyWith =>
      __$$_ReleaseGroupCopyWithImpl<_$_ReleaseGroup>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReleaseGroupToJson(
      this,
    );
  }
}

abstract class _ReleaseGroup implements ReleaseGroup {
  const factory _ReleaseGroup(
      {required final String id,
      required final String title}) = _$_ReleaseGroup;

  factory _ReleaseGroup.fromJson(Map<String, dynamic> json) =
      _$_ReleaseGroup.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  @JsonKey(ignore: true)
  _$$_ReleaseGroupCopyWith<_$_ReleaseGroup> get copyWith =>
      throw _privateConstructorUsedError;
}
