import 'package:flutter/material.dart';

import 'app_palette.dart';
import 'app_theme_extension.dart';

final class AppTheme {
  static ThemeData build(AppPalette palette) {
    return ThemeData(
      brightness: Brightness.dark,
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.transparent,
      colorScheme: ColorScheme.fromSeed(
        seedColor: palette.primaryColor,
        brightness: Brightness.dark,
        primary: palette.primaryColor,
        secondary: palette.secondaryTextColor,
        surface: palette.surfaceStrongColor,
        error: palette.errorColor,
      ),
      textTheme: TextTheme(
        bodyLarge: TextStyle(color: palette.textColor),
        bodyMedium: TextStyle(color: palette.textColor),
        bodySmall: TextStyle(color: palette.textMutedColor),
        displayLarge: TextStyle(color: palette.textColor),
        displayMedium: TextStyle(color: palette.textColor),
        displaySmall: TextStyle(color: palette.textColor),
        titleLarge: TextStyle(color: palette.textColor, fontWeight: FontWeight.w700),
        titleMedium: TextStyle(color: palette.textColor, fontWeight: FontWeight.w600),
        titleSmall: TextStyle(color: palette.textColor),
        headlineLarge: TextStyle(color: palette.textColor, fontWeight: FontWeight.w800),
        headlineMedium: TextStyle(color: palette.textColor, fontWeight: FontWeight.w700),
        headlineSmall: TextStyle(color: palette.textColor, fontWeight: FontWeight.w700),
        labelLarge: TextStyle(color: palette.textColor, fontWeight: FontWeight.w600),
        labelMedium: TextStyle(color: palette.textMutedColor),
        labelSmall: TextStyle(color: palette.textMutedColor),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: palette.textColor),
        foregroundColor: palette.textColor,
        titleTextStyle: TextStyle(
          color: palette.textColor,
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
      ),
      cardTheme: CardThemeData(
        margin: EdgeInsets.zero,
        color: palette.surfaceStrongColor,
        shadowColor: Colors.black26,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(
            color: palette.borderColor,
            width: 1,
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
            if (states.contains(WidgetState.disabled)) {
              return palette.textDisabledColor;
            }
            return palette.textColor;
          }),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          elevation: const WidgetStatePropertyAll(0),
          backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
            if (states.contains(WidgetState.disabled)) {
              return palette.primaryColor.withValues(alpha: 0.4);
            }
            if (states.contains(WidgetState.pressed) || states.contains(WidgetState.hovered)) {
              return palette.primaryHoverColor;
            }
            return palette.primaryColor;
          }),
          foregroundColor: const WidgetStatePropertyAll(Colors.white),
          padding: const WidgetStatePropertyAll(
            EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          ),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          textStyle: const WidgetStatePropertyAll(
            TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 15,
            ),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: palette.surfaceColor,
        hintStyle: TextStyle(color: palette.textMutedColor),
        labelStyle: TextStyle(color: palette.textMutedColor),
        prefixIconColor: palette.textMutedColor,
        suffixIconColor: palette.textMutedColor,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(999),
          borderSide: BorderSide(
            color: palette.borderColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(999),
          borderSide: BorderSide(
            color: palette.borderColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(999),
          borderSide: BorderSide(
            color: palette.primaryColor.withValues(alpha: 0.6),
          ),
        ),
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: palette.surfaceStrongColor,
        contentTextStyle: TextStyle(color: palette.textColor),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: palette.borderColor),
        ),
      ),
      popupMenuTheme: PopupMenuThemeData(
        color: palette.surfaceStrongColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: palette.borderColor),
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 8,
        textStyle: TextStyle(color: palette.textColor),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: palette.surfaceColor,
        selectedColor: palette.primaryColor,
        disabledColor: palette.skipColor,
        secondarySelectedColor: palette.primaryColor,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        labelStyle: TextStyle(color: palette.textColor),
        secondaryLabelStyle: const TextStyle(color: Colors.white),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(999),
          side: BorderSide(color: palette.borderColor),
        ),
      ),
      extensions: [
        AppThemeExtension(
          backgroundGradient: palette.backgroundGradient,
          backgroundLightColor: palette.backgroundLightColor,
          surfaceColor: palette.surfaceColor,
          surfaceStrongColor: palette.surfaceStrongColor,
          borderColor: palette.borderColor,
          textMutedColor: palette.textMutedColor,
          textDisabledColor: palette.textDisabledColor,
          secondaryTextColor: palette.secondaryTextColor,
          primaryHoverColor: palette.primaryHoverColor,
          secondaryHoverColor: palette.secondaryHoverColor,
          skipColor: palette.skipColor,
          successColor: palette.successColor,
          halfSuccessColor: palette.halfSuccessColor,
        ),
      ],
    );
  }
}