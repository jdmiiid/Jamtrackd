import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tasktrack/widgets/register_avatar.dart';

import '../services/firebase_auth/firebase_storage_service.dart';

class TestPage extends ConsumerWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        registerAvatar(context, ref),
        ElevatedButton(
            onPressed: () {
              FirebaseStorageService()
                  .uploadImageAsset(ref, ref.watch(pPicAssetProvider)!);
            },
            child: const Text('Submit'))
      ],
    );
  }
}
