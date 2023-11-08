import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:Jamtrackd/providers/firebase_auth_providers.dart';

part 'firebase_storage_service.g.dart';

final pPicAssetProvider = AutoDisposeStateProvider<File?>((ref) => null);

class FirebaseStorageService {
  FirebaseStorageService();

  final storageRef = FirebaseStorage.instance.ref();

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

  Future<String?> uploadImageAsset(String uid, File imageAsset) async {
    final pPicRef = storageRef.child('profile_pics/$uid');
    try {
      final uploadTask = pPicRef.putFile(imageAsset);
      final snapshot = await uploadTask.whenComplete(() {});
      final downloadUrl = await snapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      // Handle the exception when the upload or retrieval fails
      print('Error uploading image: $e');
      return null;
    }
  }

  Future<void> _uploadImage(
      Reference ref, File imageFile, WidgetRef widgetRef) async {
    try {
      await ref.putFile(imageFile);
    } on FirebaseException catch (e) {
      print(e);
    }
  }

  Future<String?> deleteProfilePicture({required String uid}) async {
    final pPicRef = storageRef.child('profile_pics/$uid');
    try {
      await pPicRef.delete();
      return null; // Return null if the function completes normally.
    } on FirebaseException catch (e) {
      // Caught an exception from Firebase.
      print("Failed with error '${e.code}': ${e.message}");
      return "Error: ${e.message}"; // Return a custom error message as a string.
    }
  }
}

// For RETRIEVING DOWNLOADURL
@riverpod
Future<String?> retrieveUserDownloadUrl(
    RetrieveUserDownloadUrlRef ref, String uniqUID) async {
  final storageRef = FirebaseStorage.instance.ref();
  try {
    return await storageRef.child('profile_pics/$uniqUID').getDownloadURL();
  } catch (e) {
    // Handle the exception when the profile picture doesn't exist
    return null;
  }
}
