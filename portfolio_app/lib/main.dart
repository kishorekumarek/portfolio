import 'package:flutter/material.dart';
import 'package:portfolio_app/screens/portfolio_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kishore Kumar - Flutter Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: const Color(0xFF0A0A0B),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        cardTheme: CardTheme(
          elevation: 0,
          color: Colors.white.withOpacity(0.1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: Colors.white.withOpacity(0.2), width: 1),
          ),
        ),
        textTheme: TextTheme(
          displayLarge: GoogleFonts.inter(
            fontSize: 56,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            height: 1.1,
          ),
          displayMedium: GoogleFonts.inter(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            height: 1.2,
          ),
          headlineLarge: GoogleFonts.inter(
            fontSize: 32,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
          headlineMedium: GoogleFonts.inter(
            fontSize: 28,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
          headlineSmall: GoogleFonts.inter(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
          titleLarge: GoogleFonts.inter(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
          titleMedium: GoogleFonts.inter(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
          titleSmall: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.white70,
          ),
          bodyLarge: GoogleFonts.inter(
            fontSize: 18,
            color: Colors.white70,
            height: 1.6,
          ),
          bodyMedium: GoogleFonts.inter(
            fontSize: 16,
            color: Colors.white70,
            height: 1.6,
          ),
          bodySmall: GoogleFonts.inter(
            fontSize: 14,
            color: Colors.white60,
            height: 1.5,
          ),
          labelLarge: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF6366F1),
          secondary: Color(0xFF8B5CF6),
          tertiary: Color(0xFF06B6D4),
          surface: Color(0xFF0A0A0B),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF6366F1),
            foregroundColor: Colors.white,
            elevation: 0,
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            textStyle: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
      home: const PortfolioScreen(),
    );
  }
}
