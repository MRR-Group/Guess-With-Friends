import 'package:shared_preferences/shared_preferences.dart';

class ThemeStorage {
  static const String _themeKey = 'selected_theme';

  Future<void> saveThemeId(String themeId) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString(_themeKey, themeId);
  }

  Future<String?> getSavedThemeId() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getString(_themeKey);
  }
}