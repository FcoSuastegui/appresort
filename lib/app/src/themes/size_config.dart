import 'package:flutter/material.dart';

class SizeConfig {
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double defaultSize;
  static Orientation orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
  }
}

double getProportionateScreenHeight(double height) {
  double screenHeight = SizeConfig.screenHeight;
  // 812 es la altura que el diseñador usa en el diseño
  return (height / 812.0) * screenHeight;
}

double getProportionateScreenWidth(double width) {
  double screenWidth = SizeConfig.screenWidth;
  // 375 es el ancho que el diseñador usa en el diseño
  return (width / 375.0) * screenWidth;
}
