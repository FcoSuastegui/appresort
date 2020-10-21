import 'package:appresort/app/src/themes/app_theme.dart';
import 'package:flutter/material.dart';

class CardDefault extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;
  final Function onPress;
  final double left, top, right, buttom;

  CardDefault({
    @required this.icon,
    @required this.text,
    @required this.onPress,
    this.iconColor = AppTheme.kIconColor,
    this.left = 10,
    this.top = 10.0,
    this.right = 10.0,
    this.buttom = 10.0,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onPress,
        child: ClipPath(
          clipper: ShapeBorderClipper(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(20.0),
              ),
            ),
          ),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.12,
            margin: EdgeInsets.fromLTRB(left, top, right, buttom),
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(color: AppTheme.kSecondColor, width: 7.0),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Icon(
                  icon,
                  color: iconColor,
                  size: 40.0,
                ),
                Text(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.black45,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
