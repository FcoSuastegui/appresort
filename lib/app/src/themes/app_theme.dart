
import 'package:appresort/app/src/themes/size_config.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static const kPrimaryColor = Color(0xFFC4A27D);
  static const kPrimaryLightColor = Color(0xFFEAD4A3);
  static const kPrimaryGradientColor = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFc4a27d), Color(0xFFEAD4A3)],
  );

  static const kSecondColor = Color(0xFFEAD4A3);
  static const kTextColor = Color(0xFFA3886C);
  static const kIconColor = Color(0xFFA3886C);

  static const kHeaderCircle = Color.fromRGBO(255, 255, 255, 0.17);
  static const kHeaderBlueDark = Color.fromRGBO(255, 255, 255, 0.17);
  static const kHeaderBlueLight = Color.fromRGBO(255, 255, 255, 0.17);
  static const kHeaderGreyLight = Color.fromRGBO(225, 255, 255, 0.31);
  static const kGreenBackground = Color.fromRGBO(181, 255, 155, 0.36); // 36%


  static const kAnimationDuration = Duration(milliseconds: 200);

  static final headingStyle = TextStyle(
    fontSize: getProportionateScreenWidth(28.0),
    fontWeight: FontWeight.bold,
    color: Colors.black,
    height: 1.5,
  );
}
