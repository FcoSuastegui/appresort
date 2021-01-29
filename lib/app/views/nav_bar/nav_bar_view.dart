import 'package:appresort/app/themes/adapt.dart';
import 'package:appresort/app/views/nav_bar/components/nav_bar_items.dart';
import 'package:appresort/app/views/nav_bar/components/nav_bar_pages.dart';
import 'package:appresort/app/views/nav_bar/controller/nav_bar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavBarView extends GetView<NavBarController> {
  static final String routeName = '/navigation-bar';
  const NavBarView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Adapt.initContext(context);
    return Scaffold(
      extendBody: true,
      body: const NavBarPages(),
      bottomNavigationBar: Obx(
        () => AnimatedSwitcher(
          duration: Duration(milliseconds: 300),
          child: controller.show
              ? Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: Adapt.px(25),
                  ),
                  child: const NavBarItems(),
                )
              : SizedBox.shrink(),
        ),
      ),
    );
  }
}
