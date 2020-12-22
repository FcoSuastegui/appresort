import 'package:appresort/app/themes/app_theme.dart';
import 'package:flutter/material.dart';

class NoInformationWidget extends StatelessWidget {
  final String text;
  final Function onPress;

  NoInformationWidget({
    @required this.onPress,
    this.text = 'Intentar de nuevo',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            child: Container(
              padding: const EdgeInsets.all(1.0),
              child: Image.asset(
                'assets/images/no_informacion.png',
              ),
            ),
          ),
          InkWell(
            onTap: onPress,
            child: Container(
              margin: EdgeInsets.only(top: 5.0),
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: AppTheme.kPrimaryColor,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.refresh,
                    size: 15.0,
                    color: Colors.white,
                  ),
                  Text(
                    text ?? '',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
