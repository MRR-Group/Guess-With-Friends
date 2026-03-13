import 'package:flutter/material.dart';
import 'package:guess_with_friends/src/core/theme/app_theme_extension.dart';

class AppBackground extends StatelessWidget {
  final Widget child;

  const AppBackground({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final themeExtension = Theme.of(context).extension<AppThemeExtension>()!;

    return Container(
      decoration: BoxDecoration(
        gradient: themeExtension.backgroundGradient,
      ),
      child: child,
    );
  }
}