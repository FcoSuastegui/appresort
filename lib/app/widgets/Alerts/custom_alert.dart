import 'package:appresort/app/themes/app_theme.dart';
import 'package:flutter/material.dart';

class CustomAlert extends StatefulWidget {
  final AlertDialogType type;
  final String text;
  final Function action;
  CustomAlert({
    @required this.text,
    this.action,
    this.type = AlertDialogType.SUCCESS,
  });

  @override
  _CustomAlertState createState() => _CustomAlertState();
}

class _CustomAlertState extends State<CustomAlert> {
  String textButton = 'Aceptar';
  Icon icono;
  Color backgroundcolor;

  @override
  void initState() {
    super.initState();
    switch (widget.type) {
      case AlertDialogType.SUCCESS:
        icono = Icon(Icons.done, color: AppTheme.kPrimaryColor, size: 50);
        backgroundcolor = AppTheme.kPrimaryColor;
        break;
      case AlertDialogType.ERROR:
        icono = Icon(Icons.error, color: Colors.red, size: 50);
        backgroundcolor = Color(0xFFF14141);
        break;
      case AlertDialogType.WARNING:
        icono = Icon(Icons.warning, color: Colors.orange, size: 50);
        backgroundcolor = Colors.orange;
        break;
      default:
        icono = Icon(Icons.done, color: AppTheme.kPrimaryColor, size: 50);
        backgroundcolor = AppTheme.kPrimaryColor;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      title: Center(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: backgroundcolor, width: 1.5),
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.white,
                  ),
                  child: icono,
                ),
                Container(
                  margin: EdgeInsets.only(top: 12),
                  child: Text(
                    widget.text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: GestureDetector(
                        onTap: widget.action != null
                            ? widget.action
                            : () => Navigator.of(context).pop(),
                        child: Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.only(
                            left: 0.0,
                            right: 0.0,
                            top: 20.0,
                            bottom: 0.0,
                          ),
                          decoration: BoxDecoration(
                            color: backgroundcolor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(100),
                            ),
                          ),
                          child: Text(
                            textButton,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

enum AlertDialogType {
  SUCCESS,
  ERROR,
  WARNING,
  INFO,
}
