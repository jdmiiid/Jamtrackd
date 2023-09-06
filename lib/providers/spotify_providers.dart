import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tasktrack/models/album_or_artist.dart';
import 'package:tasktrack/providers/misc_providers.dart';

import '../models/album.dart';

part 'spotify_providers.g.dart';

final spotifyTokenProvider = StateProvider((ref) => '');

final userSearchProvider = StateProvider<String>((ref) => '');

final artistIdProvider = StateProvider<String>((ref) => '');

final albumIdProvider = StateProvider<String>((ref) => '');

final albumDataProvider = StateProvider<AlbumOrArtist?>((ref) => null);

//Tracklist Code
class TracklistNotifier extends StateNotifier<List<String>> {
  TracklistNotifier(List<String> initialTracklist) : super(initialTracklist);

  void updateMyTiles(int oldIndex, int newIndex, List<String> tracklist) {
    final tile = tracklist.removeAt(oldIndex);
    tracklist.insert(newIndex, tile);
    state = tracklist;
  }
}
//Tracklist Code

@riverpod
Future<List<AlbumOrArtist>> queriedSearch(QueriedSearchRef ref,
    {int artistLimit = 3, int albumLimit = 7}) async {
  final String query = ref.watch(userSearchProvider);
  final String encodedQuery = Uri.encodeQueryComponent(query);

  final Uri artistSearchUri = Uri.parse(
      'https://api.spotify.com/v1/search?q=$encodedQuery&type=artist&market=US&limit=$artistLimit&offset=0');
  final Uri albumSearchUri = Uri.parse(
      'https://api.spotify.com/v1/search?q=$encodedQuery&type=album&market=US&limit=$albumLimit&offset=0');

  //connect success for Artists
  List<AlbumOrArtist> parseArtistSearchResult(http.Response response) {
    final data = jsonDecode(response.body);
    final List jsonItemList = data['artists']['items'];

    final List<AlbumOrArtist> albumOrArtistList = [];

    for (var item in jsonItemList) {
      albumOrArtistList.add(AlbumOrArtist.fromJson(item));
    }

    return albumOrArtistList;
  }

  //connect success for Albums
  List<AlbumOrArtist> parseAlbumSearchResult(http.Response response) {
    final data = jsonDecode(response.body);
    final List jsonItemList = data['albums']['items'];

    final List<AlbumOrArtist> albumOrArtistList = [];

    for (var item in jsonItemList) {
      albumOrArtistList.add(AlbumOrArtist.fromJson(item));
    }

    return albumOrArtistList;
  }

  final List<AlbumOrArtist> artistResult =
      await interactSpotifyApi<List<AlbumOrArtist>>(
            endpoint: artistSearchUri,
            ifConnected: parseArtistSearchResult,
            ref: ref,
          ) ??
          [];

  final List<AlbumOrArtist> albumResult =
      await interactSpotifyApi<List<AlbumOrArtist>>(
            endpoint: albumSearchUri,
            ifConnected: parseAlbumSearchResult,
            ref: ref,
          ) ??
          [];

  // Combine the results into a single list
  final List<AlbumOrArtist> combinedResult = [...artistResult, ...albumResult];
  return combinedResult;
}

@riverpod
Future<List<AlbumOrArtist>> artistSelection(ArtistSelectionRef ref) async {
  final String uniqId = ref.watch(artistIdProvider);
  final String encodedQuery = Uri.encodeQueryComponent(uniqId);

  final Uri albumSearchUri = Uri.parse(
      'https://api.spotify.com/v1/artists/$encodedQuery/albums?include_groups=album&market=US');

  List<AlbumOrArtist> parseAlbumSearchResult(http.Response response) {
    final data = jsonDecode(response.body);
    final List jsonItemList = data['items'];

    final List<AlbumOrArtist> albumOrArtistList = [];

    for (var item in jsonItemList) {
      albumOrArtistList.add(AlbumOrArtist.fromJson(item));
    }

    return albumOrArtistList;
  }

  final List<AlbumOrArtist> albumResult =
      await interactSpotifyApi<List<AlbumOrArtist>>(
            endpoint: albumSearchUri,
            ifConnected: parseAlbumSearchResult,
            ref: ref,
          ) ??
          [];

  return albumResult;
}

// Might be useless. Come back and delete this, if necessary.
@riverpod
Future<Album?> albumSelection(AlbumSelectionRef ref) async {
  final uniqId = ref.watch(albumIdProvider);
  final String encodedQuery = Uri.encodeQueryComponent(uniqId);

  final Uri albumSearchUri =
      Uri.parse('https://api.spotify.com/v1/albums/$encodedQuery');

  Album parseAlbumSearchResult(http.Response response) {
    final data = jsonDecode(response.body);
    return Album.fromJson(data);
  }

  final Album? albumResult = await interactSpotifyApi<Album>(
    endpoint: albumSearchUri,
    ifConnected: parseAlbumSearchResult,
    ref: ref,
  );

  return albumResult;
}

@riverpod
Future<List<String>> getTrackData(GetTrackDataRef ref) async {
  final AlbumOrArtist? albumData = ref.read(albumDataProvider);
  final String uniqId = albumData!.id;
  final isOpen = ref.watch(stateNotifierExpansion) as bool;

  if (isOpen) {
    return [];
  } else {
    final String encodedQuery = Uri.encodeQueryComponent(uniqId);

    final Uri tracksSearchUri = Uri.parse(
        'https://api.spotify.com/v1/albums/$encodedQuery/tracks?market=US');

    List<String> parseTrackSearchResult(http.Response response) {
      final data = jsonDecode(response.body);

      final List<String> trackList = [];

      for (Map<String, dynamic> item in data['items']) {
        trackList.add(item['name'] as String);
      }

      ref.read(stateNotifierTrackList.notifier).state = trackList;

      return trackList;
    }

    final List<String> tracksResult = await interactSpotifyApi(
          endpoint: tracksSearchUri,
          ifConnected: parseTrackSearchResult,
          ref: ref,
        ) ??
        [];

    return tracksResult;
  }
}

Future<T?> interactSpotifyApi<T>({
  required Uri endpoint,
  required T Function(http.Response) ifConnected,
  //Could be WidgetRef or some auto generated Ref
  required ref,
}) async {
  final String currentToken = ref.read(spotifyTokenProvider);

  final Map<String, String> bearHeaders = {
    'Authorization': 'Bearer $currentToken'
  };

  try {
    final response = await http.get(endpoint, headers: bearHeaders);

    switch (response.statusCode) {
      case 200:
        return ifConnected(response); // Return the result of ifConnected
      case 401:
        await getSpotifyAccessToken(
            ref); // Wait for the access token to be refreshed
        return await interactSpotifyApi(
          endpoint: endpoint,
          ifConnected: ifConnected,
          ref: ref,
        ); // Return the result of the recursive call
    }
  } catch (e) {
    print('error: $e');
  }

  // Return null if the request fails or returns a non-200 status code
  return null;
}

Future<void> getSpotifyAccessToken(WidgetRef ref) async {
  const clientID = '9e4a88136865436eb1f35653190fb22b';
  final clientSecret = dotenv.env['SPOTIFY_API_CLIENT_SECRET'];

  final String basicAuth =
      'Basic ${base64Encode(utf8.encode('$clientID:$clientSecret'))}';

  final Map<String, String> headers = {
    'Authorization': basicAuth,
    'Content-Type': 'application/x-www-form-urlencoded',
  };

  final Map<String, String> body = {
    'grant_type': 'client_credentials',
  };

  final Uri tokenEndpoint = Uri.parse('https://accounts.spotify.com/api/token');

  try {
    final response = await http.post(
      tokenEndpoint,
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      ref.read(spotifyTokenProvider.notifier).state = data['access_token'];
    } else {
      print('Shit, we tried and failed (getToken): ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
  }
}

class FavoritesNotifier extends StateNotifier<bool> {
  FavoritesNotifier() : super(false);

  // true, if dark
  // false, if light

  void changeBool() {
    state = state ? false : true;
  }
}

final stateNotifierFavorites =
    StateNotifierProvider((ref) => FavoritesNotifier());

class TrackListNotifier extends StateNotifier<List<String>> {
  TrackListNotifier() : super([]);

  void updateMyTiles(int oldIndex, int newIndex, List<String> tracklist) {
    if (oldIndex < newIndex) {
      newIndex--;
    }

    final tile = tracklist.removeAt(oldIndex);
    tracklist.insert(newIndex, tile);
    state = tracklist;
  }
}

final stateNotifierTrackList =
    StateNotifierProvider((ref) => TrackListNotifier());
