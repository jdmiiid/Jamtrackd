import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseAuthService {
  final FirebaseAuth _firebaseAuth;

  FirebaseAuthService(this._firebaseAuth);

  Stream<User?> get authStateChange => _firebaseAuth.authStateChanges();

  Future<String?> createUserWithEmailAndPassword(
      {required String email,
      required String firstName,
      required String lastName,
      required String username,
      required String phoneNumber,
      required String password}) async {
    try {
      await _firebaseAuth
          .createUserWithEmailAndPassword(
            email: email,
            password: password,
          )
          .then(
            (userCredential) => {
              userCredential.user!.updateDisplayName('$firstName $lastName'),
              FirebaseFirestore.instance
                  .collection('users')
                  .doc(userCredential.user!.uid)
                  .set({
                'username': username,
                'phonenumber': phoneNumber,
              })
            },
          );

      return 'Information initialized. Please verify Account.';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return '';
      } else {
        return e.message;
      }
    }
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
