import 'package:freezed_annotation/freezed_annotation.dart';

import 'artist.dart';

part 'album.freezed.dart';
part 'album.g.dart';

@freezed
class Album with _$Album {
  const factory Album({
    required String id,
    required String name,
    required List<Artist> artists,
    required String? release_date,
    required List? images,
  }) = _Album;

  factory Album.fromJson(Map<String, dynamic> json) => _$AlbumFromJson(json);
}
