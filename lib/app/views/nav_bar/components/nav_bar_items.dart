import 'package:appresort/app/themes/adapt.dart';
import 'package:appresort/app/utils/get_storage.dart';
import 'package:appresort/app/views/nav_bar/controller/nav_bar_controller.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavBarItems extends GetView<NavBarController> {
  const NavBarItems({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => CustomNavigationBar(
        elevation: 8.0,
        bubbleCurve: Curves.easeIn,
        strokeColor: Colors.transparent,
        iconSize: Adapt.px(30),
        selectedColor: Colors.grey,
        unSelectedColor: Colors.grey[300],
        backgroundColor: Colors.white,
        borderRadius: Radius.circular(
          Adapt.px(20),
        ),
        items: getItems(),
        currentIndex: controller.currentIndex,
        onTap: (int i) => controller.currentIndex = i,
        isFloating: true,
      ),
    );
  }

  List<CustomNavigationBarItem> getItems() {
    final user = GetStorages.i.user;
    List<CustomNavigationBarItem> item = [
      CustomNavigationBarItem(
        title: Text(
          "home".tr,
          style: TextStyle(
            fontSize: Adapt.px(25),
          ),
        ),
        icon: Icon(Icons.home),
      ),
      CustomNavigationBarItem(
        title: Text(
          "account".tr,
          style: TextStyle(
            fontSize: Adapt.px(25),
          ),
        ),
        icon: user.photo != null && user.photo.isNotEmpty
            ? CircleAvatar(
                backgroundImage: Image.network(user.photo).image,
              )
            : Icon(Icons.account_circle),
      ),
    ];
    /* 
    switch (user.rol) {
      case 'Admin':
        break;
      case 'Empleado':
        item.insertAll(0, [
          CustomNavigationBarItem(
            title: Text(
              "home".tr,
              style: TextStyle(
                fontSize: Adapt.px(25),
              ),
            ),
            icon: Icon(Icons.home),
          ),
        ]);
        break;
      case 'Visitante':
        item.insertAll(0, [
          CustomNavigationBarItem(
            title: Text(
              "home".tr,
              style: TextStyle(
                fontSize: Adapt.px(25),
              ),
            ),
            icon: Icon(Icons.home),
          ),
          CustomNavigationBarItem(
            title: Text(
              "coupon".tr,
              style: TextStyle(
                fontSize: Adapt.px(25),
              ),
            ),
            icon: Icon(Icons.card_membership),
          ),
        ]);
        break;
    } */
    return item;
  }
}
