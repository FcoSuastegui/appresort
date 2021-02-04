import 'package:appresort/app/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemeData {
  static BuildContext _context;
  static init(BuildContext context) {
    _context = context;
  }

  static ThemeData _themeData = ThemeData();

  static final lightTheme = ThemeData.light().copyWith(
    appBarTheme: AppBarTheme(
      color: Colors.white,
      centerTitle: false,
      elevation: 0.0,
      brightness: Brightness.light,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      textTheme: GoogleFonts.mavenProTextTheme(
        Theme.of(_context).textTheme,
      ),
    ),
    textTheme: GoogleFonts.mavenProTextTheme(
      Theme.of(_context).textTheme,
    ),
    tabBarTheme: TabBarTheme(
      labelColor: const Color(0xFF000000),
    ),
    backgroundColor: const Color(0xFFFFFFFF),
    cardColor: const Color(0xFFFFFFFF),
    bottomAppBarColor: const Color.fromRGBO(45, 45, 48, 1),
    primaryColorLight: const Color(0xFFF5F5F5),
    primaryColorDark: const Color(0xFFEEEEEE),
    primaryColor: AppTheme.kPrimaryColor,
  );
  static final darkTheme = ThemeData.dark().copyWith(
    appBarTheme: AppBarTheme(
      color: Colors.white,
      centerTitle: false,
      elevation: 0.0,
      brightness: Brightness.dark,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      textTheme: GoogleFonts.mavenProTextTheme(
        Theme.of(_context).textTheme,
      ),
    ),
    textTheme: GoogleFonts.mavenProTextTheme(
      Theme.of(_context).textTheme,
    ),
    tabBarTheme: TabBarTheme(
      labelColor: const Color(0xFFFFFFFF),
    ),
    backgroundColor: const Color(0xFF303030),
    bottomAppBarColor: const Color(0xFF191919),
    cardColor: const Color(0xFF333333),
    primaryColorLight: const Color(0xFF505050),
    primaryColorDark: const Color(0xFF404040),
    primaryColor: AppTheme.kPrimaryColor,
  );

  static MediaQueryData _mediaQuery;

  static ThemeData getTheme(BuildContext context) {
    _mediaQuery = MediaQuery.of(context);
    _themeData = _mediaQuery.platformBrightness == Brightness.light ? lightTheme : darkTheme;
    return _themeData;
  }
}
