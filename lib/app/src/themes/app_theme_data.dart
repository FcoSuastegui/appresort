import 'package:appresort/app/src/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemeData {
  static final ThemeData themeData = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      color: AppTheme.kPrimaryColor,
      elevation: 0.0,
      brightness: Brightness.light,
      centerTitle: false,
      iconTheme: IconThemeData(
        color: AppTheme.kIconColor,
      ),
      textTheme: GoogleFonts.quicksandTextTheme(
        TextTheme(
          bodyText1: TextStyle(color: Colors.white),
        ),
      ),
    ),
    canvasColor: AppTheme.kGreenBackground,
    textTheme: GoogleFonts.quicksandTextTheme(),
    unselectedWidgetColor: AppTheme.kPrimaryColor,
    toggleableActiveColor: AppTheme.kPrimaryColor,
    primaryColor: AppTheme.kPrimaryColor,
    backgroundColor: AppTheme.kPrimaryColor,
    primarySwatch: Colors.blue,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
