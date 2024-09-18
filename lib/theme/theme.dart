import 'package:flutter/material.dart';

final kLightTheme = _buildLightTheme();
final kDarkTheme = _buildDarkTheme();
const _primaryColor = Color.fromARGB(255, 118, 5, 80);
const _secondaryColor = Color.fromARGB(255, 16, 179, 25);

ThemeData _buildLightTheme() {
  final colorScheme = const ColorScheme.light().copyWith(
    primary: _primaryColor,
    secondary: _secondaryColor,
    surface: Colors.white,
    error: const Color(0xFFB00020),
  );
  return ThemeData(
      useMaterial3: false,
      brightness: Brightness.light,
      colorScheme: colorScheme,
      primaryColor: _primaryColor,
      indicatorColor: Colors.white,
      splashColor: Colors.white24,
      splashFactory: InkRipple.splashFactory,
      canvasColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
      buttonTheme: ButtonThemeData(
        colorScheme: colorScheme,
        textTheme: ButtonTextTheme.primary,
      ),
      pageTransitionsTheme: PageTransitionsTheme(
        builders: {
          for (final p in TargetPlatform.values)
            p: const CupertinoPageTransitionsBuilder()
        },
      ),
      textTheme: const TextTheme(
          // display Small
          displaySmall: TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
          // body Small
          bodySmall: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
          //body medium
          bodyMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          // body large
          bodyLarge: TextStyle(fontSize: 19, fontWeight: FontWeight.w800),
          // title medium
          titleMedium: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          // title large
          titleLarge: TextStyle(fontSize: 38, fontWeight: FontWeight.bold)));
}

ThemeData _buildDarkTheme() {
  final colorScheme = const ColorScheme.dark().copyWith(
    primary: _primaryColor,
    secondary: _secondaryColor,
    surface: const Color(0xFF202124),
    error: const Color(0xFFB00020),
  );
  return ThemeData(
      useMaterial3: false,
      brightness: Brightness.dark,
      primaryColor: _primaryColor,
      primaryColorDark: const Color(0xFF0050a0),
      primaryColorLight: _secondaryColor,
      indicatorColor: Colors.white,
      canvasColor: const Color(0xFF202124),
      scaffoldBackgroundColor: const Color(0xFF202124),
      buttonTheme: ButtonThemeData(
        colorScheme: colorScheme,
        textTheme: ButtonTextTheme.primary,
      ),
      textTheme: const TextTheme(
          // display Small
          displaySmall: TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
          // body Small
          bodySmall: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
          //body medium
          bodyMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          // body large
          bodyLarge: TextStyle(fontSize: 19, fontWeight: FontWeight.w800),
          // title medium
          titleMedium: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          // title large
          titleLarge: TextStyle(fontSize: 38, fontWeight: FontWeight.bold)));
}
