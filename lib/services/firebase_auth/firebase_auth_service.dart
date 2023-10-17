import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'firebase_storage_service.dart';

class FirebaseAuthService {
  final FirebaseAuth _firebaseAuth;

  FirebaseAuthService(this._firebaseAuth);

  Stream<User?> get authStateChange => _firebaseAuth.authStateChanges();

  Future<String?> createUserWithEmailAndPassword({
    required String email,
    required String firstName,
    required String lastName,
    required String username,
    required String password,
    File? pPicAsset,
  }) async {
    try {
      await _firebaseAuth
          .createUserWithEmailAndPassword(
            email: email,
            password: password,
          )
          .then(
            (userCredential) => {
              userCredential.user!.sendEmailVerification().then((_) async {
                await FirebaseStorageService()
                    .uploadImageAsset(userCredential.user!.uid, pPicAsset!)
                    .then((downloadUrl) async {
                  await userCredential.user!.updatePhotoURL(downloadUrl);
                });
              }),
              userCredential.user!.updateDisplayName('$firstName $lastName'),
              FirebaseFirestore.instance
                  .collection('users')
                  .doc(userCredential.user!.uid)
                  .set({'username': username})
            },
          );

      // return 'Information initialized. Please verify Account.';
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
    return null;
  }

  Future<String?> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print('signed in');
      return 'Signed in successfully';
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return e.message;
    }
  }

  Future<String?> sendPasswordResetEmail({required String email}) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(
        email: email,
      );
      return 'sendPasswordResetEmail successful';
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return e.message;
    }
  }

  Future<String?> sendEmailVerification({required String email}) async {
    final user = _firebaseAuth.currentUser;
    try {
      await user!.sendEmailVerification();
      return 'sendEmailVerification successful';
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<String?> signOut() async {
    try {
      await _firebaseAuth.signOut();
      print('signOut successful');
      return 'signOut successful';
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return e.message;
    }
  }
}
