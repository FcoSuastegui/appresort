import 'package:appresort/app/src/themes/app_theme.dart';
import 'package:flutter/material.dart';

class ListTileDismissible extends StatelessWidget {
  final IconData leading, trailing;
  final String text, subtext;
  final Color color;
  final Function press, dismissible;
  final double top, bottom;

  ListTileDismissible({
    @required this.text,
    @required this.dismissible,
    this.press,
    this.leading,
    this.trailing,
    this.subtext,
    this.top = 0.0,
    this.bottom = 0.0,
    this.color = AppTheme.kIconColor,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: press,
      child: Dismissible(
        key: UniqueKey(),
        onDismissed: press,
        child: Container(
          height: height * 0.08,
          margin: EdgeInsets.only(top: top, bottom: bottom),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              leading != null
                  ? Container(
                      child: Icon(leading, color: color),
                      margin: EdgeInsets.only(left: 20.0),
                    )
                  : Container(),
              Expanded(
                child: Container(
                  width: width,
                  margin: EdgeInsets.only(left: 20.0),
                  child: Text(
                    text,
                    style: TextStyle(
                      color: Colors.black45,
                    ),
                  ),
                ),
              ),
              subtext != null
                  ? Container(
                      margin: EdgeInsets.only(right: 20.0),
                      child: Text(
                        subtext,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black45,
                        ),
                      ),
                    )
                  : Container(),
              trailing != null
                  ? Container(
                      child: Icon(trailing, color: color),
                      margin: EdgeInsets.only(right: 20.0),
                    )
                  : Container(),
            ],
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              stops: [0.020, 0.015],
              colors: [AppTheme.kPrimaryColor, Colors.white],
            ),
            boxShadow: [
              BoxShadow(
                blurRadius: 3.0,
                color: Colors.grey[400],
              ),
            ],
            borderRadius: BorderRadius.all(
              Radius.circular(5.0),
            ),
            border: Border.all(width: 0.3, color: Colors.grey[200]),
          ),
        ),
      ),
    );
  }
}
