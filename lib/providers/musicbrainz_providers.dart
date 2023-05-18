import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/artist.dart';
import '../models/release_group.dart';

final userSearchProvider = StateProvider<String>((ref) => '');

final searchQueryProvider = StateProvider((ref) => "");

final artistListProvider =
    FutureProvider.family<List<Artist>, String>((ref, query) async {
  final response = await http.get(Uri.parse(
      'https://musicbrainz.org/ws/2/artist/?query=artist:$query&fmt=json&limit=5'));
  if (response.statusCode == 200) {
    final List json = jsonDecode(response.body)['artists'];
    final List<Artist> artistList =
        json.map((e) => Artist.fromJson(e)).toList();
    return artistList;
  } else {
    throw Exception('Failed to load albeezy');
  }
});

final releaseGroupListProvider =
    FutureProvider.family<List<ReleaseGroup>, String?>((ref, mbid) async {
  final response = await http.get(Uri.parse(
      'https://musicbrainz.org/ws/2/artist/$mbid?inc=release-groups&fmt=json'));
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    final json = jsonDecode(response.body);
    final albumList = <ReleaseGroup>[];
    final List jsonReleaseGroupList = json['release-groups'];

    for (var i in jsonReleaseGroupList) {
      if (i['secondary-types'].isEmpty && i['primary-type'] == 'Album') {
        albumList.add(ReleaseGroup.fromJson(i));
      }
    }

    return albumList;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load albeezy');
  }
});
