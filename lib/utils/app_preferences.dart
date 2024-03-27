import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AppPreferences {
  static final AppPreferences _instance = AppPreferences._internal();
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage(
      aOptions: AndroidOptions(encryptedSharedPreferences: true));

  static const userIdKey = "uId";

  factory AppPreferences() {
    return _instance;
  }

  AppPreferences._internal();

  Future<void> setString(String key, String value) async {
    await _secureStorage.write(key: key, value: value);
  }

  Future<String?> getString(String key) async {
    return await _secureStorage.read(key: key);
  }

  Future<void> removeString(String key) async {
    await _secureStorage.delete(key: key);
  }

  Future<void> saveUserId({required String employeeId}) async {
    await setString(userIdKey, employeeId);
  }

  Future<String?> getUserId() async {
    return await getString(userIdKey);
  }

  Future<void> removeUserId() async {
    await removeString(userIdKey);
  }
}
