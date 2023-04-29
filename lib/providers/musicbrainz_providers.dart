import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/release_group.dart';

final releaseGroupListProvider = FutureProvider((ref) async {
  final response = await http.get(Uri.parse(
      'https://musicbrainz.org/ws/2/artist/f2492c31-54a8-4347-a1fc-f81f72873bbf?inc=release-groups&fmt=json'));
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    final result = jsonDecode(response.body)['release-groups'];
    return result;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load albeezy');
  }
});

// final coverArtProvider = FutureProvider((ref) async {
//   ref.watch(releaseGroupListProvider).when(
//         data: (releaseGroupList) {
//           return releaseGroupList[0].id;
//         },
//         error: (Object error, StackTrace stackTrace) {
//           const Text("Error: Your mom");
//         },
//         loading: () => const CircularProgressIndicator(),
//       );

//   final response =
//       await http.get(Uri.parse('http://coverartarchive.org/release-group/'));
//   if (response.statusCode == 200) {
//     // If the server did return a 200 OK response,
//     // then parse the JSON.
//     return jsonDecode(response.body)['images'][0];
//   } else {
//     // If the server did not return a 200 OK response,
//     // then throw an exception.
//     throw Exception('Failed to load sharsh');
//   }
// });
