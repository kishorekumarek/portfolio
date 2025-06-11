import 'package:flutter/material.dart';

enum AppThemeType {
  defaultTheme,
  pastel,
  light,
  dark,
}

class AppTheme {
  final String name;
  final Color primary;
  final Color secondary;
  final Color accent;
  final Color success;
  final Color warning;
  final Color error;
  final Color background;
  final Color surface;
  final Color textPrimary;
  final Color textSecondary;
  final Color cardBackground;
  final Color cardBorder;
  final List<Color> backgroundGradient;
  final List<Color> primaryGradient;

  const AppTheme({
    required this.name,
    required this.primary,
    required this.secondary,
    required this.accent,
    required this.success,
    required this.warning,
    required this.error,
    required this.background,
    required this.surface,
    required this.textPrimary,
    required this.textSecondary,
    required this.cardBackground,
    required this.cardBorder,
    required this.backgroundGradient,
    required this.primaryGradient,
  });

  static const AppTheme defaultTheme = AppTheme(
    name: 'Default',
    primary: Color(0xFF6366F1),
    secondary: Color(0xFF8B5CF6),
    accent: Color(0xFF06B6D4),
    success: Color(0xFF10B981),
    warning: Color(0xFFF59E0B),
    error: Color(0xFFEF4444),
    background: Color(0xFF0A0A0B),
    surface: Color(0xFF1A1A1B),
    textPrimary: Colors.white,
    textSecondary: Color(0xFFB3B3B3),
    cardBackground: Color(0xFF1F1F23),
    cardBorder: Color(0xFF2D2D30),
    backgroundGradient: [
      Color(0xFF0A0A0B),
      Color(0xFF1A1A1B),
      Color(0xFF0A0A0B),
    ],
    primaryGradient: [
      Color(0xFF6366F1),
      Color(0xFF8B5CF6),
    ],
  );

  static const AppTheme pastelTheme = AppTheme(
    name: 'Pastel',
    primary: Color(0xFFB794F6),
    secondary: Color(0xFFF093FB),
    accent: Color(0xFF81E6D9),
    success: Color(0xFF68D391),
    warning: Color(0xFFFBD38D),
    error: Color(0xFFFEB2B2),
    background: Color(0xFF1A1625),
    surface: Color(0xFF2D2438),
    textPrimary: Color(0xFFFFFFFF),
    textSecondary: Color(0xFFE2E8F0),
    cardBackground: Color(0xFF322548),
    cardBorder: Color(0xFF4A5568),
    backgroundGradient: [
      Color(0xFF1A1625),
      Color(0xFF2D2438),
      Color(0xFF1A1625),
    ],
    primaryGradient: [
      Color(0xFFB794F6),
      Color(0xFFF093FB),
    ],
  );

  static const AppTheme lightTheme = AppTheme(
    name: 'Light',
    primary: Color(0xFF4F46E5),
    secondary: Color(0xFF7C3AED),
    accent: Color(0xFF0891B2),
    success: Color(0xFF059669),
    warning: Color(0xFFD97706),
    error: Color(0xFFDC2626),
    background: Color(0xFFFAFAFA),
    surface: Color(0xFFFFFFFF),
    textPrimary: Color(0xFF111827),
    textSecondary: Color(0xFF4B5563),
    cardBackground: Color(0xFFFFFFFF),
    cardBorder: Color(0xFFE5E7EB),
    backgroundGradient: [
      Color(0xFFFAFAFA),
      Color(0xFFF3F4F6),
      Color(0xFFFAFAFA),
    ],
    primaryGradient: [
      Color(0xFF4F46E5),
      Color(0xFF7C3AED),
    ],
  );

  static const AppTheme darkTheme = AppTheme(
    name: 'Dark',
    primary: Color(0xFF818CF8),
    secondary: Color(0xFFA78BFA),
    accent: Color(0xFF22D3EE),
    success: Color(0xFF34D399),
    warning: Color(0xFFFBBF24),
    error: Color(0xFFF87171),
    background: Color(0xFF000000),
    surface: Color(0xFF0D1117),
    textPrimary: Color(0xFFF9FAFB),
    textSecondary: Color(0xFFD1D5DB),
    cardBackground: Color(0xFF161B22),
    cardBorder: Color(0xFF21262D),
    backgroundGradient: [
      Color(0xFF000000),
      Color(0xFF0D1117),
      Color(0xFF000000),
    ],
    primaryGradient: [
      Color(0xFF818CF8),
      Color(0xFFA78BFA),
    ],
  );

  static Map<AppThemeType, AppTheme> themes = {
    AppThemeType.defaultTheme: defaultTheme,
    AppThemeType.pastel: pastelTheme,
    AppThemeType.light: lightTheme,
    AppThemeType.dark: darkTheme,
  };

  static AppTheme getTheme(AppThemeType type) {
    return themes[type] ?? defaultTheme;
  }
} 