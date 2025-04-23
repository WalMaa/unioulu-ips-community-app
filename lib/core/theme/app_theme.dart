import 'package:flutter/material.dart';
import 'theme_constants.dart';

enum AppTheme {
  light,
  dark,
}

class AppThemeData {

  // Common text theme settings
  static TextTheme _buildTextTheme(Color textColor) {
    return TextTheme(
      displayLarge: TextStyle(
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.bold,
        color: textColor,
      ),
      displayMedium: TextStyle(
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.bold,
        color: textColor,
      ),
      displaySmall: TextStyle(
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.bold,
        color: textColor,
      ),
      headlineMedium: TextStyle(
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.bold,
        color: textColor,
      ),
      headlineSmall: TextStyle(
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.bold,
        color: textColor,
      ),
      titleLarge: TextStyle(
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.bold,
        color: textColor,
      ),
      titleMedium: TextStyle(
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w400,
        color: textColor,
      ),
      titleSmall: TextStyle(
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w400,
        color: textColor,
      ),
      bodyLarge: TextStyle(
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w400,
        color: textColor,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w400,
        color: textColor,
      ),
      bodySmall: TextStyle(
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w300,
        color: textColor,
      ),
      labelLarge: TextStyle(
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w500,
        color: textColor,
      ),
      labelSmall: TextStyle(
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w400,
        color: textColor,
      ),
    );
  }

  // Light theme definition
  static final lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: AppPallete.whiteColor,
    cardColor: AppPallete.cardColor,
    primaryColor: AppPallete.primaryColor,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppPallete.primaryColor,
      brightness: Brightness.light,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromARGB(255, 242, 242, 242),
      actionsIconTheme: IconThemeData(color: Colors.black),
      iconTheme: IconThemeData(color: Colors.black),
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: _buildTextTheme(Colors.black),
  );

  // Dark theme definition
  static final darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppPallete.backgroundColor,
    primaryColor: AppPallete.primaryColor,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppPallete.primaryColor,
      brightness: Brightness.dark,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppPallete.backgroundColor,
      actionsIconTheme: IconThemeData(color: Colors.white),
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: _buildTextTheme(Colors.white),
  );

  // Helper method to get theme based on enum
  static ThemeData getThemeData(AppTheme theme) {
    switch (theme) {
      case AppTheme.dark:
        return darkTheme;
      case AppTheme.light:
      return lightTheme;
    }
  }
}
