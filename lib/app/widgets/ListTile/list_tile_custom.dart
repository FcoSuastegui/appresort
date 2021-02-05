import 'package:appresort/app/themes/app_theme.dart';
import 'package:flutter/material.dart';

class ListTileCustom extends StatelessWidget {
  final String title, subtitle;
  final Color backgroundicon, iconPressColor;
  final Icon icon;
  final IconData iconPress;
  final double height, width, borderRadius;
  final Function onPressed;
  final TextStyle titleStyle, subTitleStyle;
  final Border border;
  final bool showBorder;

  const ListTileCustom({
    Key key,
    this.icon,
    this.title,
    this.subtitle,
    this.backgroundicon = AppTheme.kPrimaryColor,
    this.height = 70.0,
    this.width = 70.0,
    this.borderRadius = 10.0,
    this.onPressed,
    this.titleStyle,
    this.subTitleStyle,
    this.iconPressColor = AppTheme.kPrimaryColor,
    this.iconPress = Icons.arrow_forward_ios,
    this.border,
    this.showBorder = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          borderRadius,
        ),
        child: Container(
          height: height,
          decoration: BoxDecoration(
            color: Colors.white,
            border: showBorder
                ? border ??
                    Border(
                      bottom: BorderSide(
                        width: 0.5,
                        color: AppTheme.kPrimaryColor,
                      ),
                    )
                : null,
          ),
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
                  color: iconPressColor,
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
