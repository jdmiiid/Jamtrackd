import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tasktrack/models/album_rating.dart';

import 'package:tasktrack/providers/spotify_providers.dart';
import 'package:tasktrack/widgets/bottom_nav_bar.dart';
import 'package:tasktrack/widgets/root_app_bar.dart';
import 'package:tasktrack/widgets/root_svg_picture.dart';

import '../providers/firebase_auth_providers.dart';
import '../providers/theme_providers.dart';

class AlbumsPage extends ConsumerWidget {
  AlbumsPage({super.key});

  final TextEditingController cockroller = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userData = ref.watch(firebaseAuthCurrentUserProvider);

    return Scaffold(
      appBar: RootNavAppBar(
        title: const Text('Your Reviews'),
        appBar: AppBar(),
        ref: ref,
      ),
      body: ref.watch(albumRatingCollectionStreamProvider).when(
            data: (List<AlbumRating> snapshot) {
              if (snapshot.isEmpty) {
                return Column(
                  children: [
                    TextField(controller: cockroller),
                    TextButton(
                      child: const Text('Sign out'),
                      onPressed: () {
                        ref.read(firebaseAuthServiceProvider).signOut();
                      },
                    ),
                    TextButton(
                        onPressed: () {
                          userData!.updateDisplayName(cockroller.text);
                        },
                        child: Text('Update display name'))
                  ],
                );
              }
              return ListView.separated(
                itemCount: snapshot.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 50,
                    child: ListTile(
                      leading: Image.network(snapshot[index].url),
                      title: Text(
                        snapshot[index].albumName,
                        style: const TextStyle(fontSize: 17),
                      ),
                      subtitle: Text(
                        snapshot[index].artistName,
                      ),
                      trailing: Text(
                        snapshot[index].rating.toString(),
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
              );
            },
            error: (object, stackTrace) => null,
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
