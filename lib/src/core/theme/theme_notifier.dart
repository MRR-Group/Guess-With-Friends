import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guess_with_friends/src/core/theme/app_palette.dart';

import 'app_palettes.dart';
import 'theme_storage.dart';

class ThemeNotifier extends AsyncNotifier<AppPalette> {
  late final ThemeStorage _storage;

  @override
  Future<AppPalette> build() async {
    _storage = ThemeStorage();

    final savedThemeId = await _storage.getSavedThemeId();

    if (savedThemeId == null) {
      return AppPalettes.marsEcho;
    }

    return AppPalettes.fromId(savedThemeId);
  }

  Future<void> setTheme(String id) async {
    final palette = AppPalettes.fromId(id);

    state = AsyncData(palette);
    await _storage.saveThemeId(id);
  }
}