// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'special_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SpecialUser _$SpecialUserFromJson(Map<String, dynamic> json) {
  return _SpecialUser.fromJson(json);
}

/// @nodoc
mixin _$SpecialUser {
  String? get username => throw _privateConstructorUsedError;
  String? get bio => throw _privateConstructorUsedError;
  String? get displayName => throw _privateConstructorUsedError;
  String? get downloadURL => throw _privateConstructorUsedError;
  String? get userID => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SpecialUserCopyWith<SpecialUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpecialUserCopyWith<$Res> {
  factory $SpecialUserCopyWith(
          SpecialUser value, $Res Function(SpecialUser) then) =
      _$SpecialUserCopyWithImpl<$Res, SpecialUser>;
  @useResult
  $Res call(
      {String? username,
      String? bio,
      String? displayName,
      String? downloadURL,
      String? userID});
}

/// @nodoc
class _$SpecialUserCopyWithImpl<$Res, $Val extends SpecialUser>
    implements $SpecialUserCopyWith<$Res> {
  _$SpecialUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = freezed,
    Object? bio = freezed,
    Object? displayName = freezed,
    Object? downloadURL = freezed,
    Object? userID = freezed,
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
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      downloadURL: freezed == downloadURL
          ? _value.downloadURL
          : downloadURL // ignore: cast_nullable_to_non_nullable
              as String?,
      userID: freezed == userID
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SpecialUserCopyWith<$Res>
    implements $SpecialUserCopyWith<$Res> {
  factory _$$_SpecialUserCopyWith(
          _$_SpecialUser value, $Res Function(_$_SpecialUser) then) =
      __$$_SpecialUserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? username,
      String? bio,
      String? displayName,
      String? downloadURL,
      String? userID});
}

/// @nodoc
class __$$_SpecialUserCopyWithImpl<$Res>
    extends _$SpecialUserCopyWithImpl<$Res, _$_SpecialUser>
    implements _$$_SpecialUserCopyWith<$Res> {
  __$$_SpecialUserCopyWithImpl(
      _$_SpecialUser _value, $Res Function(_$_SpecialUser) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = freezed,
    Object? bio = freezed,
    Object? displayName = freezed,
    Object? downloadURL = freezed,
    Object? userID = freezed,
  }) {
    return _then(_$_SpecialUser(
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      downloadURL: freezed == downloadURL
          ? _value.downloadURL
          : downloadURL // ignore: cast_nullable_to_non_nullable
              as String?,
      userID: freezed == userID
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SpecialUser with DiagnosticableTreeMixin implements _SpecialUser {
  const _$_SpecialUser(
      {this.username,
      this.bio,
      this.displayName,
      this.downloadURL,
      this.userID});

  factory _$_SpecialUser.fromJson(Map<String, dynamic> json) =>
      _$$_SpecialUserFromJson(json);

  @override
  final String? username;
  @override
  final String? bio;
  @override
  final String? displayName;
  @override
  final String? downloadURL;
  @override
  final String? userID;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SpecialUser(username: $username, bio: $bio, displayName: $displayName, downloadURL: $downloadURL, userID: $userID)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SpecialUser'))
      ..add(DiagnosticsProperty('username', username))
      ..add(DiagnosticsProperty('bio', bio))
      ..add(DiagnosticsProperty('displayName', displayName))
      ..add(DiagnosticsProperty('downloadURL', downloadURL))
      ..add(DiagnosticsProperty('userID', userID));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SpecialUser &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.downloadURL, downloadURL) ||
                other.downloadURL == downloadURL) &&
            (identical(other.userID, userID) || other.userID == userID));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, username, bio, displayName, downloadURL, userID);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SpecialUserCopyWith<_$_SpecialUser> get copyWith =>
      __$$_SpecialUserCopyWithImpl<_$_SpecialUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SpecialUserToJson(
      this,
    );
  }
}

abstract class _SpecialUser implements SpecialUser {
  const factory _SpecialUser(
      {final String? username,
      final String? bio,
      final String? displayName,
      final String? downloadURL,
      final String? userID}) = _$_SpecialUser;

  factory _SpecialUser.fromJson(Map<String, dynamic> json) =
      _$_SpecialUser.fromJson;

  @override
  String? get username;
  @override
  String? get bio;
  @override
  String? get displayName;
  @override
  String? get downloadURL;
  @override
  String? get userID;
  @override
  @JsonKey(ignore: true)
  _$$_SpecialUserCopyWith<_$_SpecialUser> get copyWith =>
      throw _privateConstructorUsedError;
}
