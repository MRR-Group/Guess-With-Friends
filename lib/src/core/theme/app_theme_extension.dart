import 'package:flutter/material.dart';

@immutable
class AppThemeExtension extends ThemeExtension<AppThemeExtension> {
  final Gradient backgroundGradient;
  final Color backgroundLightColor;
  final Color surfaceColor;
  final Color surfaceStrongColor;
  final Color borderColor;
  final Color textMutedColor;
  final Color textDisabledColor;
  final Color secondaryTextColor;
  final Color primaryHoverColor;
  final Color secondaryHoverColor;
  final Color skipColor;
  final Color successColor;
  final Color halfSuccessColor;

  const AppThemeExtension({
    required this.backgroundGradient,
    required this.backgroundLightColor,
    required this.surfaceColor,
    required this.surfaceStrongColor,
    required this.borderColor,
    required this.textMutedColor,
    required this.textDisabledColor,
    required this.secondaryTextColor,
    required this.primaryHoverColor,
    required this.secondaryHoverColor,
    required this.skipColor,
    required this.successColor,
    required this.halfSuccessColor,
  });

  @override
  AppThemeExtension copyWith({
    Gradient? backgroundGradient,
    Color? backgroundLightColor,
    Color? surfaceColor,
    Color? surfaceStrongColor,
    Color? borderColor,
    Color? textMutedColor,
    Color? textDisabledColor,
    Color? secondaryTextColor,
    Color? primaryHoverColor,
    Color? secondaryHoverColor,
    Color? skipColor,
    Color? successColor,
    Color? halfSuccessColor,
  }) {
    return AppThemeExtension(
      backgroundGradient: backgroundGradient ?? this.backgroundGradient,
      backgroundLightColor: backgroundLightColor ?? this.backgroundLightColor,
      surfaceColor: surfaceColor ?? this.surfaceColor,
      surfaceStrongColor: surfaceStrongColor ?? this.surfaceStrongColor,
      borderColor: borderColor ?? this.borderColor,
      textMutedColor: textMutedColor ?? this.textMutedColor,
      textDisabledColor: textDisabledColor ?? this.textDisabledColor,
      secondaryTextColor: secondaryTextColor ?? this.secondaryTextColor,
      primaryHoverColor: primaryHoverColor ?? this.primaryHoverColor,
      secondaryHoverColor: secondaryHoverColor ?? this.secondaryHoverColor,
      skipColor: skipColor ?? this.skipColor,
      successColor: successColor ?? this.successColor,
      halfSuccessColor: halfSuccessColor ?? this.halfSuccessColor,
    );
  }

  @override
  AppThemeExtension lerp(
      covariant ThemeExtension<AppThemeExtension>? other,
      double t,
      ) {
    if (other is! AppThemeExtension) {
      return this;
    }

    return AppThemeExtension(
      backgroundGradient: t < 0.5 ? backgroundGradient : other.backgroundGradient,
      backgroundLightColor: Color.lerp(backgroundLightColor, other.backgroundLightColor, t)!,
      surfaceColor: Color.lerp(surfaceColor, other.surfaceColor, t)!,
      surfaceStrongColor: Color.lerp(surfaceStrongColor, other.surfaceStrongColor, t)!,
      borderColor: Color.lerp(borderColor, other.borderColor, t)!,
      textMutedColor: Color.lerp(textMutedColor, other.textMutedColor, t)!,
      textDisabledColor: Color.lerp(textDisabledColor, other.textDisabledColor, t)!,
      secondaryTextColor: Color.lerp(secondaryTextColor, other.secondaryTextColor, t)!,
      primaryHoverColor: Color.lerp(primaryHoverColor, other.primaryHoverColor, t)!,
      secondaryHoverColor: Color.lerp(secondaryHoverColor, other.secondaryHoverColor, t)!,
      skipColor: Color.lerp(skipColor, other.skipColor, t)!,
      successColor: Color.lerp(successColor, other.successColor, t)!,
      halfSuccessColor: Color.lerp(halfSuccessColor, other.halfSuccessColor, t)!,
    );
  }
}