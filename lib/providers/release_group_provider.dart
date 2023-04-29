import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hooks_riverpod/hooks_riverpod.dart';

final ReleaseGroupListProvider = FutureProvider((ref) async {
  final response = await http.get(Uri.parse(
      'https://musicbrainz.org/ws/2/artist/f2492c31-54a8-4347-a1fc-f81f72873bbf?inc=release-groups&fmt=json'));
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return jsonDecode(response.body)['release-groups'];
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load albeezy');
  }
});
