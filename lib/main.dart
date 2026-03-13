import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guess_with_friends/config/env.dart';
import 'package:guess_with_friends/src/core/routes/route_provider.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:guess_with_friends/src/core/theme/app_palettes.dart';
import 'package:guess_with_friends/src/core/theme/app_theme.dart';
import 'package:guess_with_friends/src/core/theme/theme_provider.dart';

Future<void> main() async {
  await dotenv.load();
  usePathUrlStrategy();

  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends ConsumerWidget  {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    final themeState = ref.watch(themeProvider);
    final palette = themeState.value ?? AppPalettes.marsEcho;

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.build(palette),
      routerConfig: router,
      title: Env.appName,
    );
  }
}
