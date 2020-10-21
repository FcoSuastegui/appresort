import 'package:appresort/app/src/themes/app_theme.dart';
import 'package:appresort/app/src/themes/size_config.dart';
import 'package:appresort/app/src/views/navigation_bar/controller/navigation_bar_controller.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationBarView extends GetView<NavigationBarController> {
  static final String routeName = '/navigation-bar';
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Obx(
      () => Scaffold(
        body: controller.page[controller.index],
        backgroundColor: Colors.white,
        bottomNavigationBar: BottomNavigationBar(
          selectedFontSize: 10.0,
          backgroundColor: Colors.white,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: AppTheme.kIconColor, size: 18),
              label: "Inicio",
            ),
            BottomNavigationBarItem(
              icon: Badge(
                badgeContent: Text(
                  "2",
                  style: TextStyle(color: Colors.white, fontSize: 10.0),
                ),
                child: Icon(
                  Icons.notifications,
                  color: AppTheme.kIconColor,
                  size: 18,
                ),
              ),
              label: "Notificaciones",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings, color: AppTheme.kIconColor, size: 18),
              label: "Configuración",
            ),
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: controller.index,
          onTap: controller.selectIndex,
        ),
      ),
    );
  }
}
