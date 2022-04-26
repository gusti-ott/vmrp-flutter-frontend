import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static final Color _lightPrimaryColor = Color(0xFF485696);
  static final Color _lightOnPrimaryColor = Color(0xFFFE7E7E7);
  static const Color _lightTextColorPrimary = Color(0xFFFE7E7E7);

  static final Color _lightSecondaryColor = Color(0xFFF9C784);
  //static final Color _lightSecondaryColor = Color(0xFFFC7A1E);
  static final Color _lightOnSecondaryColor = Color.fromARGB(255, 17, 17, 17);
  static const Color _lightTextColorSecondary = Color.fromARGB(255, 10, 10, 10);

  static final Color _darkPrimaryColor = Color(0xFF485696);
  static final Color _darkOnPrimaryColor = Color(0xFFFE7E7E7);
  static const Color _darkTextColorPrimary = Color(0xFFFE7E7E7);

  static final Color _darkSecondaryColor = Color(0xFFF9C784);
  //static final Color _lightSecondaryColor = Color(0xFFFC7A1E);
  static final Color _darkOnSecondaryColor = Color.fromARGB(255, 17, 17, 17);
  static const Color _darkTextColorSecondary = Color.fromARGB(255, 10, 10, 10);

  static const Color _appbarColorLight = Color(0xFF707BAB);
  static const Color _appbarColorDark = Color.fromARGB(255, 10, 10, 10);

  static const Color _bottomNavigationBarIconColorSelected = Color(0xFFF9C784);
  static const Color _bottomNavigationBarIconColorUnselected =
      Color(0xFFE7E7E7);

  static const Color _iconColor = Colors.blueGrey;
  static const Color _iconColorDark = Colors.blueGrey;

  static const TextStyle _lightHeadingText = TextStyle(
      color: _lightTextColorPrimary,
      fontFamily: "Rubik",
      fontStyle: FontStyle.normal,
      fontSize: 18);

  static const TextStyle _lightBodyText = TextStyle(
      color: _lightTextColorPrimary,
      fontFamily: "Rubik",
      fontStyle: FontStyle.italic,
      fontSize: 14);

  static const TextStyle _lightInputText = TextStyle(
      color: _lightTextColorSecondary,
      fontFamily: "Rubik",
      fontStyle: FontStyle.normal,
      fontSize: 18);

  static const TextStyle _lightBodyTextButton = TextStyle(
      color: _lightTextColorSecondary,
      fontFamily: "Rubik",
      fontStyle: FontStyle.normal,
      fontSize: 16);

  static const TextTheme _lightTextTheme = TextTheme(
      headline1: _lightHeadingText,
      bodyText1: _lightBodyText,
      bodyText2: _lightInputText,
      button: _lightBodyTextButton);

  static const TextTheme _darkTextTheme = TextTheme(
      headline1: _lightHeadingText,
      bodyText1: _lightBodyText,
      bodyText2: _lightInputText,
      button: _lightBodyTextButton);

  static final ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: _lightPrimaryColor,
      appBarTheme: const AppBarTheme(
          color: _appbarColorLight,
          iconTheme: IconThemeData(color: _iconColor)),
      bottomAppBarColor: _appbarColorLight,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: _appbarColorLight,
          selectedItemColor: _bottomNavigationBarIconColorSelected,
          unselectedItemColor: _bottomNavigationBarIconColorUnselected),
      colorScheme: ColorScheme.light(
          primary: _lightPrimaryColor,
          onPrimary: _lightOnPrimaryColor,
          secondary: _lightSecondaryColor,
          onSecondary: _lightOnSecondaryColor),
      textTheme: _lightTextTheme);

  static final ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: _lightPrimaryColor,
      appBarTheme: const AppBarTheme(
          color: _appbarColorDark,
          iconTheme: IconThemeData(color: _iconColorDark)),
      bottomAppBarColor: _appbarColorDark,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: _appbarColorDark,
          selectedItemColor: _bottomNavigationBarIconColorSelected,
          unselectedItemColor: _bottomNavigationBarIconColorUnselected),
      colorScheme: ColorScheme.light(
          primary: _darkPrimaryColor,
          onPrimary: _darkOnPrimaryColor,
          secondary: _darkSecondaryColor,
          onSecondary: _darkOnSecondaryColor),
      textTheme: _darkTextTheme);
}
