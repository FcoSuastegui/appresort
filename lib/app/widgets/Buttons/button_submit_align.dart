import 'package:appresort/app/themes/app_theme.dart';
import 'package:flutter/material.dart';

class ButtonSubmitAlign extends StatelessWidget {
  final String text;
  final Function submit;
  final Color color;

  const ButtonSubmitAlign({
    Key key,
    @required this.text,
    @required this.submit,
    this.color = AppTheme.kPrimaryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40.0, bottom: 20.0),
      child: Align(
        alignment: Alignment.bottomRight,
        child: RaisedButton(
          onPressed: submit,
          color: Colors.white,
          padding: EdgeInsets.all(10.0),
          elevation: 0.0,
          child: Text(text),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
            side: BorderSide(
              color: color,
            ),
          ),
        ),
      ),
    );
  }
}
