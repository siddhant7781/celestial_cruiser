// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:shared_preferences/shared_preferences.dart';

import 'package:nasa_hackathon/src/repo/interface/itoken_repo.dart';

class PrefsTokenRepo implements ITokenRepo {
  final SharedPreferences prefs;
  PrefsTokenRepo({
    required this.prefs,
  });

  static const key = "token";

  @override
  Future<void> clear() => prefs.remove(key);

  @override
  Future<String?> fetchToken() async {
    final token = prefs.getString(key);
    return token;
  }

  @override
  Future<void> saveToken(String token) => prefs.setString(key, token);
}
