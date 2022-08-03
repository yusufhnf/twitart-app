import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../helper/error_handler.dart';

class FirebaseSocialAuthService {
  final _firebaseAuth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  Stream<User?> watchUser() => _firebaseAuth.authStateChanges();

  Future<bool> isSignedIn() async {
    final User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return true;
    }
    return false;
  }

  Future<UserCredential?> _firebaseSignInWithCredential(
      String email, OAuthCredential oAuthCredential) async {
    try {
      final userCredential = await _firebaseAuth.signInWithCredential(
        oAuthCredential,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw AuthException(errorMessage: e.message);
    } catch (e) {
      throw const AuthException();
    }
  }

  Future<bool> createNewUser(User user) async {
    try {
      await _firestore.collection("users").doc(user.uid).set({
        "name": user.displayName,
        "email": user.email,
        "displayImage": user.photoURL,
        "bio": ""
      });
      return true;
    } on FirebaseException catch (e) {
      throw AuthException(errorMessage: e.message);
    } catch (e) {
      return false;
    }
  }

  Future<User?> getUser() async {
    final user = _firebaseAuth.currentUser;
    return user;
  }

  Future<UserCredential?> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final googleAuth = await googleUser?.authentication;
    if (googleAuth == null || googleUser == null) return null;

    final googleOauth = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    final firebaseCredential =
        await _firebaseSignInWithCredential(googleUser.email, googleOauth);

    return firebaseCredential;
  }

  Future<void> signOut() async {
    final isGoogleSignedIn = await GoogleSignIn().isSignedIn();
    if (isGoogleSignedIn) {
      await GoogleSignIn().disconnect();
      await GoogleSignIn().signOut();
    }

    await _firebaseAuth.signOut();
  }
}
