import 'dart:async';
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/album_or_artist.dart';

part 'spotify_providers.g.dart';

// State Providers
final spotifyTokenProvider = StateProvider<String>((ref) => '');
final userSearchProvider = StateProvider<String>((ref) => '');
final artistIdProvider = StateProvider<String>((ref) => '');
final albumIdProvider = StateProvider<String>((ref) => '');
final staticOrderProvider =
    StateProvider<List<Map<String, dynamic>>>((ref) => []);
final albumDataProvider = StateProvider<AlbumOrArtist?>((ref) => null);

// Riverpod Async Functions
@riverpod
Future<List<AlbumOrArtist>> queriedAlbumSearch(QueriedAlbumSearchRef ref,
    {int artistLimit = 3,
    int albumLimit = 7,
    bool albumsOrUsers = false}) async {
  final String query = ref.watch(userSearchProvider);
  final String encodedQuery = Uri.encodeQueryComponent(query);

  final Uri artistSearchUri = Uri.parse(
      'https://api.spotify.com/v1/search?q=$encodedQuery&type=artist&market=US&limit=$artistLimit&offset=0');
  final Uri albumSearchUri = Uri.parse(
      'https://api.spotify.com/v1/search?q=$encodedQuery&type=album&market=US&limit=$albumLimit&offset=0');

  List<AlbumOrArtist> parseSearchResult(http.Response response, String key) {
    final data = jsonDecode(response.body);
    final List jsonItemList = data[key]['items'];

    return jsonItemList.map((item) => AlbumOrArtist.fromJson(item)).toList();
  }

  final List<AlbumOrArtist> artistResult =
      await interactSpotifyApi<List<AlbumOrArtist>>(
            endpoint: artistSearchUri,
            ifConnected: (response) => parseSearchResult(response, 'artists'),
            ref: ref,
          ) ??
          [];

  final List<AlbumOrArtist> albumResult =
      await interactSpotifyApi<List<AlbumOrArtist>>(
            endpoint: albumSearchUri,
            ifConnected: (response) => parseSearchResult(response, 'albums'),
            ref: ref,
          ) ??
          [];

  return [...artistResult, ...albumResult];
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

    return jsonItemList.map((item) => AlbumOrArtist.fromJson(item)).toList();
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

@riverpod
Future<List<String>> getTrackData(GetTrackDataRef ref) async {
  final AlbumOrArtist? albumData = ref.read(albumDataProvider);
  final String uniqId = albumData!.id;
  final List<String> trackList = ['-'];
  int offset = 0;
  const int limit = 12;

  while (true) {
    final Uri tracksSearchUri = Uri.parse(
        'https://api.spotify.com/v1/albums/$uniqId/tracks?market=US&offset=$offset&limit=$limit');

    List<String> parseTrackSearchResult(http.Response response) {
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final items = data['items']
            as List<dynamic>; // Ensure 'items' is treated as a List

        return items.map((item) => (item['name'] as String)).toList();
      } else {
        print('Failed to fetch track data: ${response.statusCode}');
        throw Exception('Failed to fetch track data: ${response.statusCode}');
      }
    }

    final List<String>? newTrackList = await interactSpotifyApi<List<String>>(
      endpoint: tracksSearchUri,
      ifConnected: parseTrackSearchResult,
      ref: ref,
    );

    if (newTrackList != null) {
      trackList.addAll(newTrackList);

      if (newTrackList.length < limit) {
        return trackList;
      } else {
        offset += limit;
      }
    } else {
      break;
    }
  }
  return trackList;
}

Future<T?> interactSpotifyApi<T>({
  required Uri endpoint,
  required T Function(http.Response) ifConnected,
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
        return ifConnected(response);
      case 401:
        await getSpotifyAccessToken(ref);
        return await interactSpotifyApi(
          endpoint: endpoint,
          ifConnected: ifConnected,
          ref: ref,
        );
    }
  } catch (e) {
    print('error moma sus: $e');
  }

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
      print('Failed to get Spotify access token: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
  }
}

// State Notifiers
class FavoritesNotifier extends StateNotifier<bool> {
  FavoritesNotifier() : super(false);

  void changeBool() {
    state = !state;
  }
}

final stateNotifierFavorites =
    StateNotifierProvider((ref) => FavoritesNotifier());

class TrackListNotifier extends StateNotifier<List<String>> {
  TrackListNotifier() : super([]);

  void updateMyTiles(List<String> tracklist) {
    if (tracklist.first == '-') {
      state = tracklist;
    } else {
      state.addAll(tracklist);
    }
  }
}

final stateNotifierTrackList =
    StateNotifierProvider<TrackListNotifier, List<String>>(
  (ref) => TrackListNotifier(),
);
