import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'app_palette.dart';
import 'app_palettes.dart';
import 'theme_storage.dart';

part 'theme_provider.g.dart';

@riverpod
ThemeStorage themeStorage(Ref ref) {
  return ThemeStorage();
}

@riverpod
class ThemeNotifier extends _$ThemeNotifier {
  @override
  Future<AppPalette> build() async {
    final storage = ref.watch(themeStorageProvider);
    final savedThemeId = await storage.getSavedThemeId();

    return AppPalettes.fromId(savedThemeId!);
  }

  Future<void> setTheme(String themeId) async {
    final palette = AppPalettes.fromId(themeId);

    state = AsyncData(palette);

    final storage = ref.read(themeStorageProvider);
    await storage.saveThemeId(palette.id);
  }
}