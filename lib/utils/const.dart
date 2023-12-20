import 'package:flutter/material.dart';

// container colors
// primary color
const kPrimaryColor = Color.fromARGB(255, 23, 21, 26);
// secondary color
const kSecondaryColor = Color.fromARGB(255, 0, 0, 0);

// FONT COLOR
// primary font color
const kPrimaryFontColor = Color.fromARGB(255, 255, 255, 255);

// Device Size
// device width
double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;
// device height
double deviceHeight(BuildContext context) => MediaQuery.of(context).size.height;

// Light mode theme
final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  canvasColor: Colors.white,
  primaryColor: const Color.fromARGB(255, 109, 155, 192),
  hintColor: const Color.fromARGB(255, 62, 68, 78),
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    color: const Color.fromARGB(255, 109, 155, 192),
    iconTheme: const IconThemeData(color: Colors.white),
    toolbarTextStyle: const TextTheme(
      titleLarge: TextStyle(color: Colors.white, fontSize: 20.0),
    ).bodyMedium,
    titleTextStyle: const TextTheme(
      titleLarge: TextStyle(color: Colors.white, fontSize: 20.0),
    ).titleLarge,
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(foregroundColor: Colors.blue),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.blue,
    foregroundColor: Colors.white,
  ),
  // Add other customizations as needed
);

// Dark mode theme
final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.black,
  canvasColor: const Color.fromARGB(255, 23, 21, 26),
  hintColor: Colors.grey,
  scaffoldBackgroundColor: Colors.black,
  appBarTheme: AppBarTheme(
    color: Colors.black,
    iconTheme: const IconThemeData(color: Colors.white),
    toolbarTextStyle: const TextTheme(
      titleLarge: TextStyle(color: Colors.white, fontSize: 20.0),
    ).bodyMedium,
    titleTextStyle: const TextTheme(
      titleLarge: TextStyle(color: Colors.white, fontSize: 20.0),
    ).titleLarge,
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(foregroundColor: Colors.grey),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.grey,
    foregroundColor: Colors.black,
  ),
  // Add other customizations as needed
);
