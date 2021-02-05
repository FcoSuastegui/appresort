import 'package:appresort/app/views/account/account_view.dart';
import 'package:appresort/app/views/home/home_view.dart';
import 'package:appresort/app/views/nav_bar/controller/nav_bar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavBarPages extends GetView<NavBarController> {
  const NavBarPages({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => getPages(controller.currentIndex),
    );
  }

  Widget getPages(int index) {
    /* final user = GetStorages.i.user; */
    List<Widget> pages = [
      HomeView(),
      AccountView(),
    ];

    /* switch (user.rol) {
      case 'Admin':
        break;
      case 'Empleado':
        pages = <Widget>[
          ScanView(),
          AccountView(),
        ];
        break;
      case 'Visitante':
        pages = <Widget>[
          HomeView(),
          CouponView(),
          AccountView(),
        ];
        break;
      default:
    } */

    int indexAux = index + 1;
    return pages.length >= indexAux ? pages[index] : HomeView();
  }
}
