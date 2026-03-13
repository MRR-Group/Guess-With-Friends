import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guess_with_friends/config/env.dart';
import 'package:guess_with_friends/src/core/routes/route_names.dart';
import 'package:guess_with_friends/src/feature/home/presentation/pages/page.dart';
import 'package:guess_with_friends/src/feature/home/presentation/pages/select_theme_page.dart';
import 'package:guess_with_friends/src/shared/presentation/widgets/app_background.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return AppBackground(
            child: Scaffold(
              appBar: AppBar(title: Text(Env.appName)),
              body: child,
            ),
          );
        },
        routes: [
          GoRoute(
            path: homeRoute,
            builder: (context, state) => SelectThemePage(),
          ),
          GoRoute(
            path: settingsRoute,
            builder: (context, state) => SelectThemePage(),
          ),
        ],
      ),
    ],
  );
});