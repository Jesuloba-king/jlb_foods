import 'package:flutter/material.dart';

// colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  // fontFamily: "Suse",
  useMaterial3: true,
  colorScheme: ColorScheme.light(
      surface: Colors.grey.shade300,
      primary: Colors.grey.shade500,
      secondary: Colors.grey.shade100,
      tertiary: Colors.white,
      inversePrimary: Colors.grey.shade700),
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  // fontFamily: "Suse",
  useMaterial3: true,
  colorScheme: ColorScheme.dark(
    surface: const Color.fromARGB(255, 20, 20, 20),
    primary: const Color.fromARGB(255, 122, 122, 122),
    secondary: const Color.fromARGB(255, 30, 30, 30),
    tertiary: const Color.fromARGB(255, 47, 47, 47),
    inversePrimary: Colors.grey.shade300,
  ),
);
