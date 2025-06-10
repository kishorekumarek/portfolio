import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Import for direct font usage if needed

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Using Theme.of(context) to get AppBarTheme for background color
    final appBarTheme = Theme.of(context).appBarTheme;
    final textTheme = Theme.of(context).textTheme;

    return LayoutBuilder(
      builder: (context, constraints) {
        double screenWidth = constraints.maxWidth;
        bool isNarrowScreen = screenWidth < 600;

        TextStyle nameStyle = GoogleFonts.robotoSlab( // Using GoogleFonts directly for consistency
          fontSize: isNarrowScreen ? 22 : 28,
          fontWeight: FontWeight.bold,
          color: appBarTheme.titleTextStyle?.color ?? Colors.white, // Use color from theme
        );

        TextStyle contactStyle = GoogleFonts.roboto(
          fontSize: isNarrowScreen ? 13 : 16,
          color: appBarTheme.titleTextStyle?.color?.withOpacity(0.85) ?? Colors.white.withOpacity(0.85), // Slightly less prominent
        );

        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: isNarrowScreen ? 16.0 : 24.0,
            vertical: isNarrowScreen ? 12.0 : 16.0,
          ),
          color: appBarTheme.backgroundColor, // Use color from theme
          alignment: Alignment.center, // Center content vertically and horizontally
          child: isNarrowScreen
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'K I S H O R E K U M A R',
                      style: nameStyle,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '0547868607 | kishorekumarek@pm.me',
                      style: contactStyle,
                      textAlign: TextAlign.center,
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('K I S H O R E K U M A R', style: nameStyle),
                    Text('0547868607 | kishorekumarek@pm.me', style: contactStyle),
                  ],
                ),
        );
      },
    );
  }
}
