import 'package:appresort/app/themes/app_theme.dart';
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
    return RaisedButton(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.5,
        padding: EdgeInsets.symmetric(
          vertical: 10.0,
        ),
        margin: EdgeInsets.only(
          bottom: 10,
          top: 10,
          left: 20,
          right: 20,
        ),
        child: Center(
          child: Text(
            text,
          ),
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 0.0,
      color: color,
      textColor: textColor,
      onPressed: submit,
    );
  }
}
