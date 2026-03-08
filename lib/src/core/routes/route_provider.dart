import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guess_with_friends/config/env.dart';
import 'package:guess_with_friends/src/core/routes/route_names.dart';
import 'package:guess_with_friends/src/feature/home/presentation/pages/page.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return Scaffold(
            appBar: AppBar(title: Text(Env.appName)),
            body: child,
          );
        },
        routes: [
          GoRoute(
            path: homeRoute,
            builder: (context, state) => HomePage(),
          ),
        ],
      ),
    ],
  );
});