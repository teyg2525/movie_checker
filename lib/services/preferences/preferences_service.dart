import 'package:injectable/injectable.dart';
import 'package:movie_checker/constants/urls.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Singleton()
class PreferencesService {
  final _firebaseDBUrl = 'firebaseDB';
  final _brightnessKey = 'brightness';
  final _languageKey = 'language';

  SharedPreferences? _instance;

  Future<SharedPreferences> get _preferences async =>
      _instance ??= await SharedPreferences.getInstance();

  Future<String> getFirebaseDBUrl() async {
    final preferences = await _preferences;
    final version = preferences.getString(_firebaseDBUrl);

    return version ?? Urls.defaultFirebaseDatabaseUrl;
  }

  Future<bool> saveFirebaseDBUrl(String version) async {
    final preferences = await _preferences;
    final result = await preferences.setString(_firebaseDBUrl, version);

    return result;
  }

  Future<String> getBrightness() async {
    final preferences = await _preferences;
    final brightness = preferences.getString(_brightnessKey);

    return brightness ?? '';
  }

  Future<bool> saveBrightness(String? brightness) async {
    final preferences = await _preferences;

    bool result;

    if (brightness != null) {
      result = await preferences.setString(_brightnessKey, brightness);
    } else {
      result = await preferences.remove(_brightnessKey);
    }

    return result;
  }

  Future<String> getLanguage() async {
    final preferences = await _preferences;
    final language = preferences.getString(_languageKey);

    return language ?? '';
  }

  Future<bool> saveLanguage(String? language) async {
    final preferences = await _preferences;

    bool result;

    if (language != null) {
      result = await preferences.setString(_languageKey, language);
    } else {
      result = await preferences.remove(_languageKey);
    }

    return result;
  }
}
