import 'package:appresort/app/themes/app_theme.dart';
import 'package:appresort/app/themes/adapt.dart';
import 'package:flutter/material.dart';

class ButtonSubmit extends StatelessWidget {
  final Function submit;
  final String text;
  final Color color, textColor;

  ButtonSubmit({
    Key key,
    @required this.submit,
    @required this.text,
    this.color = AppTheme.kPrimaryColor,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.5,
        padding: EdgeInsets.symmetric(
          vertical: Adapt.px(10),
        ),
        child: Center(
          child: Text(
            text,
          ),
        ),
      ),
      color: color,
      textColor: textColor,
      onPressed: submit,
    );
  }
}
