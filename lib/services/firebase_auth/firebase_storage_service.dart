import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tasktrack/providers/firebase_auth_providers.dart';

part 'firebase_storage_service.g.dart';

final pPicURLProvider = StateProvider<String>((ref) => '');
final pPicAssetProvider = StateProvider<File?>((ref) => null);

final postIDProvider = StateProvider<String>((ref) => '');

class FirebaseStorageService {
  FirebaseStorageService();

  final storageRef = FirebaseStorage.instance.ref();

  Future<void> _uploadImage(
      Reference ref, File imageFile, WidgetRef widgetRef) async {
    try {
      await ref.putFile(imageFile);
      final picURL = await ref.getDownloadURL();
      widgetRef.read(pPicURLProvider.notifier).state = picURL;
    } on FirebaseException catch (e) {
      print(e);
    }
  }

  Future<void> pickUploadImage(WidgetRef ref) async {
    final userData = ref.watch(firebaseAuthCurrentUserProvider);
    final profileImage = await ImagePicker()
        .pickImage(source: ImageSource.gallery, maxHeight: 512, maxWidth: 512);

    if (profileImage != null) {
      final pPicRef = storageRef.child('profile_pics/${userData!.uid}');
      await _uploadImage(pPicRef, File(profileImage.path), ref);
    }
  }

  Future<void> downloadImageAsset(WidgetRef ref) async {
    final profileImage = await ImagePicker()
        .pickImage(source: ImageSource.gallery, maxHeight: 512, maxWidth: 512);

    if (profileImage != null) {
      ref.read(pPicAssetProvider.notifier).state = File(profileImage.path);
    }
  }

  Future<void> uploadImageAsset(WidgetRef ref, File imageAsset) async {
    final userData = ref.watch(firebaseAuthCurrentUserProvider);
    final pPicRef = storageRef.child('profile_pics/${userData!.uid}');
    await _uploadImage(pPicRef, imageAsset, ref);
  }
}

// For comments
class UpdatedDownloadUrlNotifier extends StateNotifier<String> {
  UpdatedDownloadUrlNotifier() : super('');

  Future<void> retrieveUserImageUrl(WidgetRef ref, String uniqUID) async {
    final storageRef = FirebaseStorage.instance.ref();
    final dURL =
        await storageRef.child('profile_pics/$uniqUID').getDownloadURL();
    state = dURL;
  }
}

final stateNotifierDownloadURL =
    StateNotifierProvider<UpdatedDownloadUrlNotifier, String>(
  (ref) => UpdatedDownloadUrlNotifier(),
);

@riverpod
Future<String> retrieveImageUrl(RetrieveImageUrlRef ref, String uniqUID) async {
  final storageRef = FirebaseStorage.instance.ref();
  return await storageRef.child('profile_pics/$uniqUID').getDownloadURL();
}
