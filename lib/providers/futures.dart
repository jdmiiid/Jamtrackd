import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:tasktrack/providers/musicbrainz_providers.dart';

import '../models/artist.dart';
import '../models/debouncer.dart';

class ArtistListAPI {
  static Future<List<String>> searchArtists({required String query}) async {
    const limit = 8;
    final url =
        'https://musicbrainz.org/ws/2/artist/?query=artist:$query&fmt=json&limit=$limit';

    final response = await http.get(Uri.parse(url));
    final body = jsonDecode(response.body)['artists'];
    if (body != null) {
      return body.map<String>((json) {
        final name = json['name'];
        return '$name';
      }).toList();
    }
    return [];
  }
}
