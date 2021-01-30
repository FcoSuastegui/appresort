import 'package:appresort/app/routes/routes.dart';
import 'package:appresort/app/themes/app_theme.dart';
import 'package:appresort/app/views/home/controllers/home_controller.dart';
import 'package:appresort/app/widgets/Cards/card_default.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeKnow extends GetView<HomeController> {
  const HomeKnow({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 10.0),
          child: Text(
            'Conoce: ',
            style: TextStyle(
              color: AppTheme.kTextColor,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CardDefault(
                text: 'Reglamentos',
                icon: Icons.info,
                onPress: () => Routes.goToPage('/reglamento'),
                left: 0.0,
              ),
              CardDefault(
                text: 'Asambleas',
                icon: Icons.gavel,
                onPress: () => Routes.goToPage(''),
              ),
              CardDefault(
                text: 'Saldos',
                icon: Icons.attach_money,
                onPress: () => Routes.goToPage('/saldo'),
                right: 0.0,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
