import 'package:flutter/material.dart';

class Adapt {
  static final Adapt _instancia = new Adapt._internal();
  factory Adapt() => _instancia;
  Adapt._internal();

  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static Orientation orientation;
  static double topbarH;
  static double botbarH;
  static double pixelRatio;

  static var _ratio;

  static initContext(BuildContext context) {
    if (_mediaQueryData == null) {
      _mediaQueryData = MediaQuery.of(context);
      screenWidth = _mediaQueryData.size.width;
      screenHeight = _mediaQueryData.size.height;
      orientation = _mediaQueryData.orientation;

      topbarH = _mediaQueryData.padding.top;
      botbarH = _mediaQueryData.padding.bottom;
      pixelRatio = _mediaQueryData.devicePixelRatio;
    }
  }

  static double getProportionateScreenHeight(double height, {double heightInit = 812}) {
    double screenHeight = Adapt.screenHeight;
    return (height / heightInit) * screenHeight;
  }

  static double getProportionateScreenWidth(double width, {double widthInit = 375.0}) {
    double screenWidth = Adapt.screenWidth;
    return (width / widthInit) * screenWidth;
  }

  static init(int number) {
    int uiwidth = number is int ? number : 750;
    _ratio = screenWidth / uiwidth;
  }

  static px(number) {
    if (!(_ratio is double || _ratio is int)) {
      Adapt.init(750);
    }
    return number * _ratio;
  }
}
