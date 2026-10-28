import 'package:shared_preferences/shared_preferences.dart';

import '../models/sign_up_model.dart';

class AuthRepository {
  static const _loginKey = 'login';
  static const _userModelKey = 'usermodel';

  static Map<String, Object?> toProfile(SignUpModel user) {
    return {
      'username': user.username,
      'email': user.email,
    };
  }

  Future<SharedPreferences> _prefs() async => SharedPreferences.getInstance();

  Future<bool> isLoggedIn() async {
    final prefs = await _prefs();
    return prefs.getBool(_loginKey) ?? false;
  }

  Future<SignUpModel> loadUser() async {
    final prefs = await _prefs();
    final data = prefs.getStringList(_userModelKey) ?? const ['NULL', 'NULL'];
    return SignUpModel(
      username: data.length > 1 ? data[1] : 'NULL',
      email: data.isNotEmpty ? data[0] : 'NULL',
      password: '',
    );
  }

  Future<void> saveUser(SignUpModel user) async {
    final prefs = await _prefs();
    await prefs.setBool(_loginKey, true);
    await prefs.setStringList(_userModelKey, [
      user.email,
      user.username,
    ]);
  }

  Future<void> clearUser() async {
    final prefs = await _prefs();
    await prefs.setBool(_loginKey, false);
    await prefs.remove(_userModelKey);
  }
}
