import 'package:flutter/material.dart';

class ThemeApp {
  static final ligthTheme = ThemeData(
      primaryColor: const Color.fromRGBO(236, 101, 29, 1),
      scaffoldBackgroundColor: Colors.white,
      fontFamily: 'WorkSan',
      colorScheme: ColorScheme.light(
        primary: const Color.fromRGBO(236, 101, 29, 1),
        secondary: const Color.fromRGBO(231, 126, 39, 1),
        tertiary: const Color.fromRGBO(226, 159, 58, 1),
        onPrimary: const Color.fromRGBO(13, 97, 41, 1),
        onSecondary: const Color.fromRGBO(137, 195, 124, 1),
        onTertiary: const Color.fromRGBO(197, 223, 179, 1),
        onError: Colors.red,
        onSurface: Colors.blueGrey[900]!,
      ),
      appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(
        color: Colors.white,
      )));
}
