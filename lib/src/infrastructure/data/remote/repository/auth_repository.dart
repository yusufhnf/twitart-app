import 'package:firebase_auth/firebase_auth.dart';

import '../../local/preference_storage.dart';
import '../firebase_social_auth_service.dart';

class AuthRepository {
  final FirebaseSocialAuthService _firebaseSocialAuthService =
      FirebaseSocialAuthService();
  final PreferenceStorage _preferenceStorage = PreferenceStorage();

  Future<bool> isSignedIn() async {
    final isSignedIn = await _firebaseSocialAuthService.isSignedIn();
    return isSignedIn;
  }

  Future<void> cacheUIDToStorage(String uid) async =>
      await _preferenceStorage.setUID(uid);

  Future<String?> getUserUID() async => await _preferenceStorage.getUID();

  Future<User?> getUser() async {
    final currentUser = await _firebaseSocialAuthService.getUser();
    return currentUser;
  }

  Future<String?> signInWithGoogle() async {
    final result = await _firebaseSocialAuthService.signInWithGoogle();
    if (result != null) {
      final user = result.user;
      if (user != null) {
        _firebaseSocialAuthService.createNewUser(user);
        _preferenceStorage.setUID(user.uid);
        return user.uid;
      }
    }
    return null;
  }

  Future<void> signOut() async {
    await _firebaseSocialAuthService.signOut();
    await _preferenceStorage.clearAllStorage();
  }
}
