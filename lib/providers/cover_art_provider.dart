import 'dart:collection';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:tasktrack/providers/release_group_provider.dart';

import '../models/release_group_model.dart';

final coverArtProvider = FutureProvider((ref) async {
  AsyncValue<ReleaseGroupModel> releaseGroupList =
      ref.watch(ReleaseGroupListProvider);

  (releaseGroupList).when(
    data: (releaseGroupList) {
      return releaseGroupList[0].id;
    },
    error: (Object error, StackTrace stackTrace) {
      const Text("Error: Your mom");
    },
    loading: () => const CircularProgressIndicator(),
  );

  final response =
      await http.get(Uri.parse('http://coverartarchive.org/release-group/'));
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return jsonDecode(response.body)['images'][0];
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load sharsh');
  }
});
