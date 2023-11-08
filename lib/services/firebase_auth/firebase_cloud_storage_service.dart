// import 'package:riverpod_annotation/riverpod_annotation.dart';

// part 'firebase_cloud_storage_service.g.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseCloudStorageService {
  FirebaseCloudStorageService();

  final CollectionReference<Map<String, dynamic>> userCollectionRef =
      FirebaseFirestore.instance.collection('users');

  Future<String?> deleteUserFromDB({required String uid}) async {
    try {
      await userCollectionRef.doc(uid).delete();
      return null;
    } on FirebaseException catch (e) {
      print('Error ${e.code}: ${e.message}');
      return e.message;
    }
  }
}
