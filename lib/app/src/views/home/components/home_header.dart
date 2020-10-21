import 'package:appresort/app/src/themes/app_theme.dart';
import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height * 0.10,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: AppTheme.kPrimaryColor,
          ),
        ),
      ],
    );
  }
}
