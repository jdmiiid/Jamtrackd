import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tasktrack/services/firebase_auth/firebase_storage_service.dart';

import '../providers/firebase_auth_providers.dart';

class ProfileHeader extends ConsumerWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currUserData = ref.watch(firebaseAuthCurrentUserProvider);
    final ImageProvider pPicImageProvider = currUserData!.photoURL == null
        ? const AssetImage('assets/images/Maccy_Boy.jpeg')
        : NetworkImage(currUserData.photoURL!) as ImageProvider;

    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        CircleAvatar(
                            radius: 40, backgroundImage: pPicImageProvider),
                        const Positioned(
                          child: Icon(
                            Icons.add_a_photo,
                            size: 22,
                          ),
                        ),
                      ],
                    ),
                    onTap: () async {
                      FirebaseStorageService().pickUploadImage(ref);
                    },
                  ),
                  Text(currUserData.displayName!),
                ],
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text(
                              '17',
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                            Text('Reviews'),
                          ],
                        ),
                        Column(
                          children: [
                            Text('17',
                                style: TextStyle(fontWeight: FontWeight.w700)),
                            Text('Followers'),
                          ],
                        ),
                        Column(
                          children: [
                            Text('17',
                                style: TextStyle(fontWeight: FontWeight.w700)),
                            Text('Following'),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 7),
                    Padding(
                      padding: const EdgeInsets.only(left: 7, right: 5),
                      child: GestureDetector(
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(3)),
                          child: const Padding(
                            padding: EdgeInsets.only(top: 4, bottom: 4),
                            child: Text(
                              'Sign out placeholder',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        onTap: () =>
                            ref.read(firebaseAuthServiceProvider).signOut(),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          const Text('Bio goes here'),
        ],
      ),
    );
  }
}
