import 'package:flutter/material.dart';
import 'theme_constants.dart';

enum AppTheme {
  Light,
  Dark,
}

class AppThemeData {
  static final lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: AppPallete.whiteColor,
    primaryColor: Colors.indigo,
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.indigo)
        .copyWith(secondary: Colors.indigoAccent),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromARGB(255, 242, 242, 242),
      actionsIconTheme: IconThemeData(color: Colors.black),
      iconTheme: IconThemeData(color: Colors.black),
      titleTextStyle: TextStyle(
          color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.bold,
          color: Colors.black),
      displayMedium: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.bold,
          color: Colors.black),
      displaySmall: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.bold,
          color: Colors.black),
      headlineMedium: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.bold,
          color: Colors.black),
      headlineSmall: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.bold,
          color: Colors.black),
      titleLarge: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.bold,
          color: Colors.black),
      titleMedium: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w400,
          color: Colors.black),
      titleSmall: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w400,
          color: Colors.black),
      bodyLarge: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w400,
          color: Colors.black),
      bodyMedium: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w400,
          color: Colors.black),
      bodySmall: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w300,
          color: Colors.black),
      labelLarge: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w500,
          color: Colors.black),
      labelSmall: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w400,
          color: Colors.black),
    ),
  );

  static final darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppPallete.backgroundColor,
    primaryColor: Colors.indigo,
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.indigo)
        .copyWith(secondary: Colors.indigoAccent),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppPallete.backgroundColor,
      actionsIconTheme: IconThemeData(color: Colors.white),
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
          color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.bold,
          color: Colors.white),
      displayMedium: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.bold,
          color: Colors.white),
      displaySmall: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.bold,
          color: Colors.white),
      headlineMedium: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.bold,
          color: Colors.white),
      headlineSmall: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.bold,
          color: Colors.white),
      titleLarge: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.bold,
          color: Colors.white),
      titleMedium: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w400,
          color: Colors.white),
      titleSmall: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w400,
          color: Colors.white),
      bodyLarge: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w400,
          color: Colors.white),
      bodyMedium: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w400,
          color: Colors.white),
      bodySmall: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w300,
          color: Colors.white),
      labelLarge: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w500,
          color: Colors.white),
      labelSmall: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w400,
          color: Colors.white),
    ),
  );
}
