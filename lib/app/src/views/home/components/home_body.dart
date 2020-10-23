import 'package:appresort/app/src/themes/app_theme.dart';
import 'package:appresort/app/src/views/home/controllers/home_controller.dart';
import 'package:appresort/app/src/widgets/Linner/linner_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController.instance,
      builder: (controller) => Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.85,
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
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
                children: controller.accesoRapido,
              ),
            ),
            LinnerContainer(
              width: 0.20,
              top: 10.0,
              buttom: 30.0,
            ),
            Text(
              'Accesos directos:',
              style: TextStyle(
                color: AppTheme.kTextColor,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Column(children: controller.listItems),
          ],
        ),
      ),
    );
  }
}
