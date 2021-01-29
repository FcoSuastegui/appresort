import 'package:flutter/material.dart';

class ListTileCustom extends StatelessWidget {
  final String title, subtitle;
  final Color backgroundicon, iconPressColor;
  final Icon icon;
  final IconData iconPress;
  final double height, width, borderRadius;
  final Function onPressed;
  final TextStyle titleStyle, subTitleStyle;

  const ListTileCustom({
    Key key,
    this.icon,
    this.title,
    this.subtitle,
    this.backgroundicon = Colors.red,
    this.height = 70.0,
    this.width = 70.0,
    this.borderRadius = 10.0,
    this.onPressed,
    this.titleStyle,
    this.subTitleStyle,
    this.iconPressColor,
    this.iconPress = Icons.arrow_forward_ios,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: Container(
          height: height,
          color: Colors.white,
          child: Row(
            children: <Widget>[
              icon != null
                  ? Container(
                      color: backgroundicon,
                      width: width,
                      height: height,
                      child: icon,
                    )
                  : SizedBox.shrink(),
              SizedBox(width: 10),
              Expanded(
                flex: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Text(
                        title ?? '',
                        style: titleStyle,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Container(
                      child: Text(
                        subtitle ?? '',
                        overflow: TextOverflow.ellipsis,
                        style: subTitleStyle ??
                            TextStyle(
                              color: Colors.grey,
                            ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Icon(
                  iconPress,
                  color: iconPressColor ?? Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ),
      behavior: HitTestBehavior.translucent,
      onTap: onPressed,
    );
  }
}
