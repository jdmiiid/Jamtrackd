// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:tasktrack/models/album_or_artist.dart';
// import 'package:tasktrack/providers/firebase_auth_providers.dart';
// import 'package:tasktrack/providers/misc_providers.dart';
// import 'package:tasktrack/providers/spotify_providers.dart';
// import 'package:tasktrack/widgets/bottom_nav_bar.dart';
// import 'package:tasktrack/widgets/root_app_bar.dart';

// import '../models/album_rating.dart';
// import '../models/post.dart';
// import '../providers/firebase_firestore_providers.dart';
// import '../services/firebase_auth/firebase_storage_service.dart';

// class AlbumRatingPage extends ConsumerWidget {
//   AlbumRatingPage({super.key});

//   final TextEditingController responseController = TextEditingController();
//   final TextEditingController titleController = TextEditingController();

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final albumData = ref.watch(albumDataProvider) as AlbumOrArtist;
//     final trackList = ref.watch(getTrackDataProvider);
//     final userData = ref.watch(firebaseAuthCurrentUserProvider);
//     final specialUserDataAsync = ref.watch(retrieveUserDataProvider);
//     final downloadUrl = ref
//         .read(retrieveUserDownloadUrlProvider(userData!.uid))
//         .whenData((value) => value)
//         .value;

//     const List<double> ratings = [
//       0,
//       0.5,
//       1,
//       1.5,
//       2,
//       2.5,
//       3,
//       3.5,
//       4,
//       4.5,
//       5,
//       5.5,
//       6,
//       6.5,
//       7,
//       7.5,
//       8,
//       8.5,
//       9,
//       9.5,
//       10
//     ];

//     final double selectedRating = ref.watch(ratingDropdownSelectedDouble);
//     final String selectedTrack = ref.watch(trackDropdownSelectedDouble);

//     return trackList.when(
//       data: (tracklist) {
//         return specialUserDataAsync.when(
//           data: (specialUserData) {
//             final List<DropdownMenuItem<String>> trackDropdownItems = tracklist
//                 .map(
//                   (track) => DropdownMenuItem(
//                     value: track,
//                     child: Padding(
//                       padding: const EdgeInsets.only(left: 5),
//                       child: Text(
//                         track,
//                         maxLines: 1,
//                         style: TextStyle(
//                             color: Theme.of(context).colorScheme.onBackground,
//                             fontWeight: FontWeight.bold,
//                             overflow: TextOverflow.ellipsis),
//                       ),
//                     ),
//                   ),
//                 )
//                 .toList();

//             return Scaffold(
//               appBar: RootNavAppBar(
//                   title: Text(albumData.name), appBar: AppBar(), ref: ref),
//               body: Padding(
//                 padding: const EdgeInsets.only(top: 10, bottom: 10),
//                 child: Stack(
//                   children: [
//                     Column(
//                       children: [
//                         Expanded(
//                           flex: 6,
//                           child: Padding(
//                             padding: const EdgeInsets.only(left: 10, right: 10),
//                             child: Container(
//                               decoration: BoxDecoration(
//                                   color: Theme.of(context)
//                                       .colorScheme
//                                       .secondaryContainer,
//                                   borderRadius: BorderRadius.circular(10),
//                                   border: Border.all(
//                                       color: Theme.of(context)
//                                           .colorScheme
//                                           .primary)),
//                               //Two items within the container (text + image), IntrinsicH set by image
//                               child: IntrinsicHeight(
//                                 child: Row(
//                                   children: [
//                                     // Expanded items (Column + Image) to format nicely
//                                     Expanded(
//                                       child: Column(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceEvenly,
//                                         children: [
//                                           //Column keeps Text together
//                                           Column(
//                                             children: [
//                                               Text(
//                                                 albumData.name,
//                                                 style: const TextStyle(
//                                                   fontWeight: FontWeight.bold,
//                                                   fontSize: 16,
//                                                 ),
//                                                 textAlign: TextAlign.center,
//                                               ),
//                                               const SizedBox(height: 5),
//                                               Text(
//                                                 albumData.artists![0].name,
//                                                 textAlign: TextAlign.center,
//                                               ),
//                                             ],
//                                           ),
//                                           Container(
//                                             padding: const EdgeInsets.only(
//                                                 left: 5, right: 5),
//                                             decoration: BoxDecoration(
//                                               color: Theme.of(context)
//                                                   .colorScheme
//                                                   .background,
//                                               borderRadius:
//                                                   BorderRadius.circular(10),
//                                               border: Border.all(
//                                                   color: Theme.of(context)
//                                                       .colorScheme
//                                                       .onBackground),
//                                             ),
//                                             child: DropdownButton(
//                                               value: selectedRating,
//                                               items: ratings
//                                                   .map(
//                                                     (rating) =>
//                                                         DropdownMenuItem(
//                                                       value: rating,
//                                                       child: Text(
//                                                         rating.toString(),
//                                                         style: TextStyle(
//                                                             color: Theme.of(
//                                                                     context)
//                                                                 .colorScheme
//                                                                 .onBackground),
//                                                       ),
//                                                     ),
//                                                   )
//                                                   .toList(),
//                                               onChanged: (rating) {
//                                                 ref
//                                                     .read(
//                                                         ratingDropdownSelectedDouble
//                                                             .notifier)
//                                                     .changeInt(rating!);
//                                               },
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     ClipRRect(
//                                         borderRadius: const BorderRadius.only(
//                                             topRight: Radius.circular(10),
//                                             bottomRight: Radius.circular(10)),
//                                         child: Image.network(
//                                             albumData.images![1]['url'])),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(top: 5),
//                           child: IntrinsicHeight(
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               children: [
//                                 const Flexible(
//                                   flex: 5,
//                                   child: Text(
//                                     'Favorite track: ',
//                                     style: TextStyle(fontSize: 16),
//                                   ),
//                                 ),
//                                 Flexible(
//                                   flex: 6,
//                                   child: ButtonTheme(
//                                     alignedDropdown: true,
//                                     child: DropdownButton(
//                                       isExpanded: true,
//                                       value: selectedTrack,
//                                       items: trackDropdownItems,
//                                       onChanged: (track) {
//                                         ref
//                                             .read(trackDropdownSelectedDouble
//                                                 .notifier)
//                                             .changeTrack(track!);
//                                       },
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         Flexible(
//                           flex: 10,
//                           child: Column(
//                             children: [
//                               TextField(
//                                   controller: titleController,
//                                   decoration: const InputDecoration(
//                                       hintText: "Add title...",
//                                       contentPadding:
//                                           EdgeInsets.only(left: 10)),
//                                   autocorrect: false,
//                                   minLines: 1,
//                                   maxLines: 2),
//                               TextField(
//                                 controller: responseController,
//                                 decoration: const InputDecoration(
//                                     hintText: "Add response...",
//                                     contentPadding: EdgeInsets.only(left: 10)),
//                                 minLines: 1,
//                                 maxLines: 15,
//                                 maxLength: 1260,
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                     Positioned(
//                       bottom: 0,
//                       left: 0,
//                       right: 0,
//                       child: SizedBox(
//                         width: double.infinity,
//                         child: ElevatedButton(
//                           onPressed: () async {
//                             showDialog(
//                                 context: context,
//                                 barrierDismissible: false,
//                                 builder: (context) => const Center(
//                                     child: CircularProgressIndicator()));

//                             Post finalPost = Post(
//                                 author: userData.uid,
//                                 username: specialUserData!.username!,
//                                 content: AlbumRating(
//                                   albumName: albumData.name,
//                                   releaseDate:
//                                       albumData.releaseDate!.substring(0, 4),
//                                   title: titleController.text.trim(),
//                                   artistName: albumData.artists![0].name,
//                                   url: albumData.images![1]['url'],
//                                   response: responseController.text,
//                                   rating: selectedRating,
//                                   favoriteTrack: selectedTrack,
//                                 ),
//                                 timestamp: DateTime.now().toString(),
//                                 postID: '',
//                                 likes: [],
//                                 downloadURL: downloadUrl);
//                             final String generatedAlbID =
//                                 AlbumRating.autoGeneratedDocId();
//                             await Post.createFirestorePost(
//                                 albId: generatedAlbID, albumPost: finalPost);

//                             if (context.mounted) {
//                               DefaultTabController.of(context).animateTo(0);
//                               context.go('/');
//                             }
//                           },
//                           child: const Text(
//                             'Submit review!',
//                             textAlign: TextAlign.center,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               bottomNavigationBar: BottomNavBar(),
//             );
//           },
//           loading: () => const Center(child: CircularProgressIndicator()),
//           error: (error, stacktrace) {
//             return Text(error.toString());
//           },
//         );
//       },
//       error: (Object error, StackTrace stackTrace) => Text(error.toString()),
//       loading: () => const Center(child: CircularProgressIndicator()),
//     );
//   }
// }
