import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tasktrack/models/album_or_artist.dart';
import 'package:tasktrack/models/album_review.dart';
import 'package:tasktrack/providers/firebase_auth_providers.dart';
import 'package:tasktrack/providers/misc_providers.dart';
import 'package:tasktrack/providers/spotify_providers.dart';
import 'package:tasktrack/widgets/bottom_nav_bar.dart';
import 'package:tasktrack/widgets/root_app_bar.dart';

class AlbumRatingPage extends ConsumerWidget {
  AlbumRatingPage({super.key});

  final TextEditingController responseController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userEmail = ref.read(firebaseAuthCurrentUserProvider)!.email;
    final albumData = ref.watch(albumDataProvider) as AlbumOrArtist;
    final trackList = ref.watch(getTrackDataProvider);

    const List<double> ratings = [
      0,
      0.5,
      1,
      1.5,
      2,
      2.5,
      3,
      3.5,
      4,
      4.5,
      5,
      5.5,
      6,
      6.5,
      7,
      7.5,
      8,
      8.5,
      9,
      9.5,
      10
    ];

    final double selectedItem = ref.watch(dropdownSelectedDouble);

    return Scaffold(
      appBar: RootNavAppBar(
          title: Text(albumData.name), appBar: AppBar(), ref: ref),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            Container(
              color: Theme.of(context).colorScheme.primary,
              child: Theme(
                data: Theme.of(context).copyWith(
                  tabBarTheme: TabBarTheme(
                      indicator: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                          color: Theme.of(context).colorScheme.background),
                      indicatorSize: TabBarIndicatorSize.label,
                      unselectedLabelColor:
                          Theme.of(context).colorScheme.surface),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: TabBar(
                    onTap: (index) {
                      if (trackList.value!.isEmpty || trackList.isLoading) {
                        ref.read(stateNotifierExpansion.notifier).changeBool();
                      }
                    },
                    labelStyle: const TextStyle(fontSize: 20),
                    tabs: const [
                      Tab(
                          child: Align(
                              alignment: Alignment.center,
                              child: Text("Writing"))),
                      Tab(
                          child: Align(
                              alignment: Alignment.center,
                              child: Text("Tracklist")))
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  children: [
                    Flexible(
                      fit: FlexFit.loose,
                      child: TabBarView(
                        children: [
                          Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondaryContainer,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary)),
                                  //Two items within the container (text + image), IntrinsicH set by image
                                  child: IntrinsicHeight(
                                    child: Row(
                                      children: [
                                        // Expanded items (Column + Image) to format nicely
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              //Column keeps Text together
                                              Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 15,
                                                            right: 15),
                                                    child: Text(
                                                      albumData.name,
                                                      style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 5),
                                                  Text(
                                                    albumData.artists![0].name,
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ],
                                              ),
                                              Container(
                                                padding: const EdgeInsets.only(
                                                    left: 5, right: 5),
                                                decoration: BoxDecoration(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .background,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .onBackground),
                                                ),
                                                child: DropdownButton(
                                                  value: selectedItem,
                                                  items: ratings
                                                      .map(
                                                        (rating) =>
                                                            DropdownMenuItem(
                                                          value: rating,
                                                          child: Text(
                                                            rating.toString(),
                                                            style: TextStyle(
                                                                color: Theme.of(
                                                                        context)
                                                                    .colorScheme
                                                                    .onBackground),
                                                          ),
                                                        ),
                                                      )
                                                      .toList(),
                                                  onChanged: (rating) {
                                                    ref
                                                        .read(
                                                            dropdownSelectedDouble
                                                                .notifier)
                                                        .changeInt(rating!);
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: ClipRRect(
                                              borderRadius:
                                                  const BorderRadius.only(
                                                      topRight:
                                                          Radius.circular(10),
                                                      bottomRight:
                                                          Radius.circular(10)),
                                              child: Image.network(
                                                  albumData.images![1]['url'])),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Flexible(
                                  fit: FlexFit.loose,
                                  child: TextField(
                                    controller: responseController,
                                    decoration: const InputDecoration(
                                        hintText:
                                            "If you've got something to say, drop it here!"),
                                    autocorrect: true,
                                    expands: true,
                                    maxLines: null,
                                    maxLength: 1260,
                                  ),
                                ),
                                Flexible(
                                  flex: 2,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      AlbumReview albumReview = AlbumReview(
                                        id: albumData.id,
                                        releaseDate: albumData.releaseDate,
                                        artistName: albumData.artists![0].name,
                                        url: albumData.images!.last['url'],
                                        response: responseController.text,
                                        rating: selectedItem,
                                        tracks: trackList.hasValue
                                            ? trackList.value
                                            : [],
                                      );
                                      AlbumReview.createFirestoreDocNCollection(
                                          docId: userEmail,
                                          albumName: albumData.name,
                                          albumReview: albumReview);
                                    },
                                    child: const Text(
                                      'Submit review!',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ]),
                          trackList.when(
                              data: (tracklist) {
                                final List<String> trackListNotif =
                                    ref.watch(stateNotifierTrackList)
                                        as List<String>;

                                return ReorderableListView.builder(
                                  shrinkWrap: true,
                                  onReorder: ((oldIndex, newIndex) {
                                    ref
                                        .read(stateNotifierTrackList.notifier)
                                        .updateMyTiles(
                                            oldIndex, newIndex, trackListNotif);
                                  }),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return ListTile(
                                      key: ValueKey(trackListNotif[index]),
                                      title: Text(trackListNotif[index]),
                                      leading: const Icon(Icons.menu),
                                    );
                                  },
                                  itemCount: trackListNotif.length,
                                );
                              },
                              error: (error, stackTrace) {
                                return const Text('error');
                              },
                              loading: () => const Center(
                                  child: CircularProgressIndicator())),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
