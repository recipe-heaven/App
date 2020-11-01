import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  Future<SharedPreferences> _storage = SharedPreferences.getInstance();

  Storage._privateConstructor();

  final _jwtKey = "JWTTOKEN";

  static final Storage _instance = Storage._privateConstructor();

  factory Storage() {
    return _instance;
  }

  Future<SharedPreferences> get storage {
    return this._storage;
  }

  /// Save JWT token to store
  Future<bool> saveToken(String token) async {
    var e = await this._storage;
    return await e.setString(_jwtKey, token);
  }

  Future<String> getToken() async {
    var e = await this._storage;
    return e.getString(_jwtKey);
  }
}
