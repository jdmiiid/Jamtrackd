// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'special_user_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SpecialUserData _$SpecialUserDataFromJson(Map<String, dynamic> json) {
  return _SpecialUserData.fromJson(json);
}

/// @nodoc
mixin _$SpecialUserData {
  String? get username => throw _privateConstructorUsedError;
  String? get bio => throw _privateConstructorUsedError;
  String? get userID => throw _privateConstructorUsedError;
  String? get displayName => throw _privateConstructorUsedError;
  String? get photoURL => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SpecialUserDataCopyWith<SpecialUserData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpecialUserDataCopyWith<$Res> {
  factory $SpecialUserDataCopyWith(
          SpecialUserData value, $Res Function(SpecialUserData) then) =
      _$SpecialUserDataCopyWithImpl<$Res, SpecialUserData>;
  @useResult
  $Res call(
      {String? username,
      String? bio,
      String? userID,
      String? displayName,
      String? photoURL});
}

/// @nodoc
class _$SpecialUserDataCopyWithImpl<$Res, $Val extends SpecialUserData>
    implements $SpecialUserDataCopyWith<$Res> {
  _$SpecialUserDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = freezed,
    Object? bio = freezed,
    Object? userID = freezed,
    Object? displayName = freezed,
    Object? photoURL = freezed,
  }) {
    return _then(_value.copyWith(
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      userID: freezed == userID
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String?,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      photoURL: freezed == photoURL
          ? _value.photoURL
          : photoURL // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SpecialUserDataCopyWith<$Res>
    implements $SpecialUserDataCopyWith<$Res> {
  factory _$$_SpecialUserDataCopyWith(
          _$_SpecialUserData value, $Res Function(_$_SpecialUserData) then) =
      __$$_SpecialUserDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? username,
      String? bio,
      String? userID,
      String? displayName,
      String? photoURL});
}

/// @nodoc
class __$$_SpecialUserDataCopyWithImpl<$Res>
    extends _$SpecialUserDataCopyWithImpl<$Res, _$_SpecialUserData>
    implements _$$_SpecialUserDataCopyWith<$Res> {
  __$$_SpecialUserDataCopyWithImpl(
      _$_SpecialUserData _value, $Res Function(_$_SpecialUserData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = freezed,
    Object? bio = freezed,
    Object? userID = freezed,
    Object? displayName = freezed,
    Object? photoURL = freezed,
  }) {
    return _then(_$_SpecialUserData(
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      userID: freezed == userID
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String?,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      photoURL: freezed == photoURL
          ? _value.photoURL
          : photoURL // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SpecialUserData
    with DiagnosticableTreeMixin
    implements _SpecialUserData {
  const _$_SpecialUserData(
      {this.username, this.bio, this.userID, this.displayName, this.photoURL});

  factory _$_SpecialUserData.fromJson(Map<String, dynamic> json) =>
      _$$_SpecialUserDataFromJson(json);

  @override
  final String? username;
  @override
  final String? bio;
  @override
  final String? userID;
  @override
  final String? displayName;
  @override
  final String? photoURL;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SpecialUserData(username: $username, bio: $bio, userID: $userID, displayName: $displayName, photoURL: $photoURL)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SpecialUserData'))
      ..add(DiagnosticsProperty('username', username))
      ..add(DiagnosticsProperty('bio', bio))
      ..add(DiagnosticsProperty('userID', userID))
      ..add(DiagnosticsProperty('displayName', displayName))
      ..add(DiagnosticsProperty('photoURL', photoURL));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SpecialUserData &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            (identical(other.userID, userID) || other.userID == userID) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.photoURL, photoURL) ||
                other.photoURL == photoURL));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, username, bio, userID, displayName, photoURL);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SpecialUserDataCopyWith<_$_SpecialUserData> get copyWith =>
      __$$_SpecialUserDataCopyWithImpl<_$_SpecialUserData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SpecialUserDataToJson(
      this,
    );
  }
}

abstract class _SpecialUserData implements SpecialUserData {
  const factory _SpecialUserData(
      {final String? username,
      final String? bio,
      final String? userID,
      final String? displayName,
      final String? photoURL}) = _$_SpecialUserData;

  factory _SpecialUserData.fromJson(Map<String, dynamic> json) =
      _$_SpecialUserData.fromJson;

  @override
  String? get username;
  @override
  String? get bio;
  @override
  String? get userID;
  @override
  String? get displayName;
  @override
  String? get photoURL;
  @override
  @JsonKey(ignore: true)
  _$$_SpecialUserDataCopyWith<_$_SpecialUserData> get copyWith =>
      throw _privateConstructorUsedError;
}
