import 'package:appresort/app/utils/get_storage.dart';
import 'package:appresort/app/themes/app_theme.dart';
import 'package:appresort/app/views/nav_bar/controller/nav_bar_controller.dart';
import 'package:appresort/app/views/onboarding/components/onboarding_stepper.dart';
import 'package:appresort/app/views/onboarding/controller/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingBody extends GetView<OnBoardingController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: <Widget>[
          PageView(
            controller: controller.pageViewController,
            onPageChanged: controller.onPageChanged,
            children: controller.onboarding,
          ),
          Obx(
            () => Container(
              padding: EdgeInsets.all(24.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: OnBoardingStepper(
                      pages: controller.numbPages,
                      currentPages: controller.currentPage.value,
                    ),
                  ),
                  ClipOval(
                    child: Container(
                      color: Colors.white,
                      child: IconButton(
                        icon: Icon(
                          controller.currentPage.value >= 2 ? Icons.done : Icons.trending_flat,
                          color: AppTheme.kIconColor,
                        ),
                        onPressed: () {
                          final respuesta = controller.onPressed();
                          if (respuesta) {
                            Get.find<NavBarController>().currentIndex = 0;
                            GetStorages.i.page = '/nav-bar';
                            Get.offAllNamed(GetStorages.i.page);
                          }
                        },
                        padding: EdgeInsets.all(13.0),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
