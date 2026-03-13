import 'package:flutter/material.dart';

class AppPalette {
  final String id;
  final String name;

  final Gradient backgroundGradient;
  final Color backgroundLightColor;
  final Color surfaceColor;
  final Color surfaceStrongColor;
  final Color borderColor;

  final Color textColor;
  final Color textMutedColor;
  final Color textDisabledColor;
  final Color textColorLight;
  final Color secondaryTextColor;

  final Color primaryColor;
  final Color primaryHoverColor;
  final Color secondaryColor;
  final Color secondaryHoverColor;

  final Color skipColor;
  final Color errorColor;
  final Color successColor;
  final Color halfSuccessColor;

  const AppPalette({
    required this.id,
    required this.name,
    required this.backgroundGradient,
    required this.backgroundLightColor,
    required this.surfaceColor,
    required this.surfaceStrongColor,
    required this.borderColor,
    required this.textColor,
    required this.textMutedColor,
    required this.textDisabledColor,
    required this.textColorLight,
    required this.secondaryTextColor,
    required this.primaryColor,
    required this.primaryHoverColor,
    required this.secondaryColor,
    required this.secondaryHoverColor,
    required this.skipColor,
    required this.errorColor,
    required this.successColor,
    required this.halfSuccessColor,
  });
}