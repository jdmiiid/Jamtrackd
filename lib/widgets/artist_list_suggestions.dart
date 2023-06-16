import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tasktrack/models/artist.dart';

import '../providers/musicbrainz_providers.dart';

class ArtistModList extends HookConsumerWidget {
  const ArtistModList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userQuery = ref.watch(userSearchProvider);
    AsyncValue<List<Artist>> artistList =
        ref.watch(artistListProvider(userQuery));
    return userQuery.isEmpty
        ? Center(
            child: TextButton(
            child: Text("Type the name of an artist!",
                style: Theme.of(context).textTheme.bodyMedium),
            onPressed: () {
              context.push('/feed_page');
            },
          ))
        : artistList.when(
            data: (artistList) {
              List<Artist> suggestions = artistList.where((artist) {
                final artName = artist.name
                    .toLowerCase()
                    .replaceAll(RegExp('[^A-Za-z0-9]'), '');
                final input = userQuery
                    .toLowerCase()
                    .replaceAll(RegExp('[^A-Za-z0-9]'), '');
                return artName.contains(input);
              }).toList();

              return Scaffold(
                body: Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: suggestions.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            child: Card(
                              child: ListTile(
                                title: Text(suggestions[index].name),
                              ),
                            ),
                            onTap: () {
                              String current = index.toString();
                              String mbid = suggestions[index].id;
                              String query = suggestions[index].name;
                              context.pushNamed("sample", queryParameters: {
                                'currentInd': current,
                                'name': query,
                                'mbid': mbid,
                              });
                            },
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const Divider(
                            height: 3,
                          );
                        },
                      ),
                    )
                  ],
                ),
              );
            },
            error: (error, stackTrace) => Text('$error'),
            loading: () => const Center(child: CircularProgressIndicator()));
  }
}
