import 'dart:io';
import 'package:Jamtrackd/services/firebase_auth/firebase_cloud_storage_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_storage_service.dart';

class FirebaseAuthService {
  final FirebaseAuth _firebaseAuth;

  FirebaseAuthService(this._firebaseAuth);

  // Handle Firebase exceptions consistently
  String? _handleFirebaseException(e) {
    print(e.message);
    return e.message;
  }

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
      final userCredential = await _registerUser(email, password);
      await _sendEmailVerification(userCredential);

      if (pPicAsset != null) {
        final downloadUrl = await FirebaseStorageService()
            .uploadImageAsset(userCredential.user!.uid, pPicAsset);
        final userData = {
          'displayName': '$firstName $lastName',
          'photoURL': downloadUrl,
          'username': username,
          'email': email,
          'bio': null
        };
        await _writeSpecialUserData(userCredential.user!.uid, userData);
      } else {
        final userData = {
          'displayName': '$firstName $lastName',
          'photoURL': null,
          'username': username,
          'email': email,
          'bio': null
        };
        await _writeSpecialUserData(userCredential.user!.uid, userData);
      }

      return 'Information initialized. Please verify Account.';
    } catch (e) {
      return _handleFirebaseException(e);
    }
  }

  Future<UserCredential> _registerUser(String email, String password) async {
    return await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> _sendEmailVerification(UserCredential userCredential) async {
    await userCredential.user!.sendEmailVerification();
  }

  Future<void> _writeSpecialUserData(
      String uid, Map<String, dynamic> data) async {
    await FirebaseFirestore.instance.collection('users').doc(uid).set(data);
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
    } catch (e) {
      return _handleFirebaseException(e);
    }
  }

  Future<String?> sendPasswordResetEmail({required String email}) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(
        email: email,
      );
      return 'sendPasswordResetEmail successful';
    } catch (e) {
      return _handleFirebaseException(e);
    }
  }

  Future<String?> sendEmailVerification({required String email}) async {
    final user = _firebaseAuth.currentUser;
    try {
      await user!.sendEmailVerification();
      return 'sendEmailVerification successful';
    } catch (e) {
      return _handleFirebaseException(e);
    }
  }

  Future<void> deleteUser({
    required User currentFirebaseUser,
  }) async {
    final String uid = currentFirebaseUser.uid;
    const String softEmail = 'john.meader@jamtrackd.com';
    const String softPass = 'jackjack';

    final AuthCredential credential = EmailAuthProvider.credential(
      email: softEmail,
      password: softPass,
    );

    try {
      await Future.wait([
        FirebaseStorageService().deleteProfilePicture(uid: uid),
        FirebaseCloudStorageService().deleteUserFromDB(uid: uid),
      ]);

      final validatedUser =
          await currentFirebaseUser.reauthenticateWithCredential(credential);
      await validatedUser.user!.delete();
    } catch (e) {
      print(e);
      // Handle errors if necessary
    }
  }

  Future<String?> signOut() async {
    try {
      await _firebaseAuth.signOut();
      print('signOut successful');
      return 'signOut successful';
    } catch (e) {
      return _handleFirebaseException(e);
    }
  }
}
