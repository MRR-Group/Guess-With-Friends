// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(themeStorage)
final themeStorageProvider = ThemeStorageProvider._();

final class ThemeStorageProvider
    extends $FunctionalProvider<ThemeStorage, ThemeStorage, ThemeStorage>
    with $Provider<ThemeStorage> {
  ThemeStorageProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'themeStorageProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$themeStorageHash();

  @$internal
  @override
  $ProviderElement<ThemeStorage> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ThemeStorage create(Ref ref) {
    return themeStorage(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ThemeStorage value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ThemeStorage>(value),
    );
  }
}

String _$themeStorageHash() => r'0032afc3332d522cf15bf5725a13e52be6c65f37';

@ProviderFor(ThemeNotifier)
final themeProvider = ThemeNotifierProvider._();

final class ThemeNotifierProvider
    extends $AsyncNotifierProvider<ThemeNotifier, AppPalette> {
  ThemeNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'themeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$themeNotifierHash();

  @$internal
  @override
  ThemeNotifier create() => ThemeNotifier();
}

String _$themeNotifierHash() => r'8053bf41c39f901a96ece449a4e5c10ff35c56a3';

abstract class _$ThemeNotifier extends $AsyncNotifier<AppPalette> {
  FutureOr<AppPalette> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<AppPalette>, AppPalette>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<AppPalette>, AppPalette>,
              AsyncValue<AppPalette>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
