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
      title: 'Kishore Kumar - Portfolio', // Updated title
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        scaffoldBackgroundColor: Colors.grey[100],
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blueGrey[800],
          elevation: 0, // Remove shadow for a flatter look
          titleTextStyle: GoogleFonts.robotoSlab( // AppBar title font
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          iconTheme: const IconThemeData(color: Colors.white), // Ensure icons are white
        ),
        cardTheme: CardTheme( // Define CardTheme for consistency
          elevation: 2.0,
          margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        ),
        textTheme: TextTheme(
          headlineSmall: GoogleFonts.robotoSlab( // For section headings like PROFILE, EDUCATION
            fontSize: 24, // Base size, will be adjusted by widgets
            fontWeight: FontWeight.bold,
            color: Colors.blueGrey[700],
          ),
          titleMedium: GoogleFonts.robotoSlab( // For job titles
            fontSize: 18, // Base size
            fontWeight: FontWeight.w600, // Slightly less bold than headings
            color: Colors.blueGrey[900],
          ),
          titleSmall: GoogleFonts.roboto( // For job company/duration
            fontSize: 16, // Base size
            fontStyle: FontStyle.italic,
            color: Colors.grey[700],
          ),
          bodyMedium: GoogleFonts.roboto( // For body text
            fontSize: 16, // Base size
            color: Colors.grey[800],
            height: 1.5, // Line height for readability
          ),
          labelLarge: GoogleFonts.roboto( // For Chip labels
            fontSize: 14,
            color: Colors.white,
          )
        ),
        chipTheme: ChipThemeData( // Define ChipTheme for skills
          backgroundColor: Colors.blueGrey[700],
          labelStyle: GoogleFonts.roboto(color: Colors.white, fontSize: 14),
          side: BorderSide.none,
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
        ),
        dividerTheme: DividerThemeData( // Define DividerTheme
          color: Colors.blueGrey[200],
          space: 24, // Space above and below the divider
          thickness: 1,
        ),
        // Define a color for text accents if needed, e.g. for specific highlights
        // accentColor: Colors.amber, // ThemeData.accentColor is deprecated, use colorScheme.secondary
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blueGrey,
          accentColor: Colors.amberAccent, // Used for secondary highlights if any
          brightness: Brightness.light,
        ).copyWith(secondary: Colors.amberAccent), // Explicitly set secondary for ColorScheme
      ),
      home: const PortfolioScreen(),
    );
  }
}
