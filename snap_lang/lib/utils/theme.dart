import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData theme = ThemeData(
  primarySwatch: Colors.indigo,
  scaffoldBackgroundColor: const Color.fromRGBO(249, 250, 251, 1),
  colorScheme:
      ColorScheme.fromSwatch(
        primarySwatch: Colors.indigo,
        accentColor: const Color.fromRGBO(251, 191, 36, 1),
        backgroundColor: const Color.fromRGBO(249, 250, 251, 1),
        // brightness: Brightness.light,
      ).copyWith(
        secondary: const Color.fromRGBO(16, 185, 129, 1),
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: const Color.fromRGBO(17, 24, 39, 1),
      ),
  textTheme: GoogleFonts.openSansTextTheme(),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.indigo,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
  ),
);
