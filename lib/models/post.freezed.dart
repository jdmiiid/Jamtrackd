// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Post _$PostFromJson(Map<String, dynamic> json) {
  return _Post.fromJson(json);
}

/// @nodoc
mixin _$Post {
  String get postID => throw _privateConstructorUsedError;
  String get author => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  AlbumRating get content => throw _privateConstructorUsedError;
  String get timestamp => throw _privateConstructorUsedError;
  List<dynamic> get likes => throw _privateConstructorUsedError;
  String? get downloadURL => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostCopyWith<Post> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostCopyWith<$Res> {
  factory $PostCopyWith(Post value, $Res Function(Post) then) =
      _$PostCopyWithImpl<$Res, Post>;
  @useResult
  $Res call(
      {String postID,
      String author,
      String username,
      AlbumRating content,
      String timestamp,
      List<dynamic> likes,
      String? downloadURL});

  $AlbumRatingCopyWith<$Res> get content;
}

/// @nodoc
class _$PostCopyWithImpl<$Res, $Val extends Post>
    implements $PostCopyWith<$Res> {
  _$PostCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postID = null,
    Object? author = null,
    Object? username = null,
    Object? content = null,
    Object? timestamp = null,
    Object? likes = null,
    Object? downloadURL = freezed,
  }) {
    return _then(_value.copyWith(
      postID: null == postID
          ? _value.postID
          : postID // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as AlbumRating,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String,
      likes: null == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      downloadURL: freezed == downloadURL
          ? _value.downloadURL
          : downloadURL // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AlbumRatingCopyWith<$Res> get content {
    return $AlbumRatingCopyWith<$Res>(_value.content, (value) {
      return _then(_value.copyWith(content: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_PostCopyWith<$Res> implements $PostCopyWith<$Res> {
  factory _$$_PostCopyWith(_$_Post value, $Res Function(_$_Post) then) =
      __$$_PostCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String postID,
      String author,
      String username,
      AlbumRating content,
      String timestamp,
      List<dynamic> likes,
      String? downloadURL});

  @override
  $AlbumRatingCopyWith<$Res> get content;
}

/// @nodoc
class __$$_PostCopyWithImpl<$Res> extends _$PostCopyWithImpl<$Res, _$_Post>
    implements _$$_PostCopyWith<$Res> {
  __$$_PostCopyWithImpl(_$_Post _value, $Res Function(_$_Post) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postID = null,
    Object? author = null,
    Object? username = null,
    Object? content = null,
    Object? timestamp = null,
    Object? likes = null,
    Object? downloadURL = freezed,
  }) {
    return _then(_$_Post(
      postID: null == postID
          ? _value.postID
          : postID // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as AlbumRating,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String,
      likes: null == likes
          ? _value._likes
          : likes // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      downloadURL: freezed == downloadURL
          ? _value.downloadURL
          : downloadURL // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Post implements _Post {
  const _$_Post(
      {required this.postID,
      required this.author,
      required this.username,
      required this.content,
      required this.timestamp,
      required final List<dynamic> likes,
      required this.downloadURL})
      : _likes = likes;

  factory _$_Post.fromJson(Map<String, dynamic> json) => _$$_PostFromJson(json);

  @override
  final String postID;
  @override
  final String author;
  @override
  final String username;
  @override
  final AlbumRating content;
  @override
  final String timestamp;
  final List<dynamic> _likes;
  @override
  List<dynamic> get likes {
    if (_likes is EqualUnmodifiableListView) return _likes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_likes);
  }

  @override
  final String? downloadURL;

  @override
  String toString() {
    return 'Post(postID: $postID, author: $author, username: $username, content: $content, timestamp: $timestamp, likes: $likes, downloadURL: $downloadURL)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Post &&
            (identical(other.postID, postID) || other.postID == postID) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            const DeepCollectionEquality().equals(other._likes, _likes) &&
            (identical(other.downloadURL, downloadURL) ||
                other.downloadURL == downloadURL));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      postID,
      author,
      username,
      content,
      timestamp,
      const DeepCollectionEquality().hash(_likes),
      downloadURL);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PostCopyWith<_$_Post> get copyWith =>
      __$$_PostCopyWithImpl<_$_Post>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PostToJson(
      this,
    );
  }
}

abstract class _Post implements Post {
  const factory _Post(
      {required final String postID,
      required final String author,
      required final String username,
      required final AlbumRating content,
      required final String timestamp,
      required final List<dynamic> likes,
      required final String? downloadURL}) = _$_Post;

  factory _Post.fromJson(Map<String, dynamic> json) = _$_Post.fromJson;

  @override
  String get postID;
  @override
  String get author;
  @override
  String get username;
  @override
  AlbumRating get content;
  @override
  String get timestamp;
  @override
  List<dynamic> get likes;
  @override
  String? get downloadURL;
  @override
  @JsonKey(ignore: true)
  _$$_PostCopyWith<_$_Post> get copyWith => throw _privateConstructorUsedError;
}
