import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class PreferenceStorage {
  final _storage = const FlutterSecureStorage();
  final _uidName = 'uid';

  Future<void> setUID(String uid) async =>
      await _storage.write(key: _uidName, value: uid);

  Future<String?> getUID() async {
    final uid = await _storage.read(key: _uidName);
    return uid;
  }

  Future<void> clearAllStorage() => _storage.deleteAll();
}
