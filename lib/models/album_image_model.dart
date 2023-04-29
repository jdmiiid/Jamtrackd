// This file is "main.dart"
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

// required: associates our `main.dart` with the code generated by Freezed
part 'album_image_model.freezed.dart';
// optional: Since our AlbumImageModel class is serializable, we must add this line.
// But if AlbumImageModel was not serializable, we could skip it.
part 'album_image_model.g.dart';

@freezed
class AlbumImageModel with _$AlbumImageModel {
  const factory AlbumImageModel({
    required bool back,
    required bool approved,
    required String comment,
    required bool front,
    required String id,
    required int edit,
    required String image,
    required Object thumbnails,
    required List types,
  }) = _AlbumImageModel;

  factory AlbumImageModel.fromJson(Map<String, Object?> json) =>
      _$AlbumImageModelFromJson(json);
}
