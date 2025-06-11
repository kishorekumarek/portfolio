import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'screens/portfolio_screen.dart';
import 'theme/theme_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            title: 'Kishore Kumar - Flutter Portfolio',
            debugShowCheckedModeBanner: false,
            theme: _buildTheme(themeProvider.currentTheme),
            home: const PortfolioScreen(),
          );
        },
      ),
    );
  }

  ThemeData _buildTheme(theme) {
    return ThemeData(
      useMaterial3: true,
      brightness: theme.name == 'Light' ? Brightness.light : Brightness.dark,
      colorScheme: ColorScheme.fromSeed(
        seedColor: theme.primary,
        brightness: theme.name == 'Light' ? Brightness.light : Brightness.dark,
        primary: theme.primary,
        secondary: theme.secondary,
        surface: theme.surface,
        background: theme.background,
      ),
      textTheme: GoogleFonts.interTextTheme().copyWith(
        displayLarge: GoogleFonts.inter(
          fontSize: 72,
          fontWeight: FontWeight.bold,
          color: theme.textPrimary,
        ),
        displayMedium: GoogleFonts.inter(
          fontSize: 56,
          fontWeight: FontWeight.bold,
          color: theme.textPrimary,
        ),
        headlineLarge: GoogleFonts.inter(
          fontSize: 48,
          fontWeight: FontWeight.w600,
          color: theme.textPrimary,
        ),
        headlineMedium: GoogleFonts.inter(
          fontSize: 36,
          fontWeight: FontWeight.w600,
          color: theme.textPrimary,
        ),
        headlineSmall: GoogleFonts.inter(
          fontSize: 28,
          fontWeight: FontWeight.w600,
          color: theme.textPrimary,
        ),
        titleLarge: GoogleFonts.inter(
          fontSize: 24,
          fontWeight: FontWeight.w500,
          color: theme.textPrimary,
        ),
        bodyLarge: GoogleFonts.inter(
          fontSize: 18,
          color: theme.textSecondary,
          height: 1.6,
        ),
        bodyMedium: GoogleFonts.inter(
          fontSize: 16,
          color: theme.textSecondary,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: theme.primary,
          foregroundColor: Colors.white,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
