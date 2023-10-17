import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../services/firebase_auth/firebase_storage_service.dart';

Widget registerAvatar(BuildContext context, WidgetRef ref) {
  final currentTheme = Theme.of(context);
  final profilePicFile = ref.watch(pPicAssetProvider);
  return GestureDetector(
    child: Stack(
      alignment: Alignment.bottomRight,
      children: [
        CircleAvatar(
          radius: 73,
          backgroundColor: currentTheme.colorScheme.onBackground,
          child: CircleAvatar(
            radius: 70,
            backgroundImage: profilePicFile == null
                ? const AssetImage('assets/images/no_profile_pic.jpeg')
                : FileImage(profilePicFile) as ImageProvider,
          ),
        ),
        Positioned(
          child: Icon(
            Icons.add_a_photo,
            size: 36,
            color: currentTheme.colorScheme.background,
          ),
        ),
        Positioned(
          child: Icon(
            Icons.add_a_photo,
            size: 35,
            color: currentTheme.colorScheme.primary,
          ),
        ),
      ],
    ),
    onTap: () async {
      FirebaseStorageService().downloadImageAsset(ref);
    },
  );
}
