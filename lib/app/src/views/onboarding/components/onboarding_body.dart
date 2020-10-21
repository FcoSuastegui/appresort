import 'package:appresort/app/src/helpers/get_storage.dart';
import 'package:appresort/app/src/themes/app_theme.dart';
import 'package:appresort/app/src/views/onboarding/components/onboarding_stepper.dart';
import 'package:appresort/app/src/views/onboarding/controller/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';

class OnBoardingBody extends GetView<OnBoardingController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          decoration: BoxDecoration(
            gradient: AppTheme.kPrimaryGradientColor
          ),
          child: Column(
            children: <Widget>[
              Expanded(
                child: PageView(
                  controller: controller.pageViewController,
                  onPageChanged: controller.onPageChanged,
                  children: controller.onboarding,
                ),
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
                              controller.currentPage.value >= 2
                                  ? Icons.done
                                  : Icons.trending_flat,
                              color: AppTheme.kIconColor,
                            ),
                            onPressed: () {
                              final respuesta = controller.onPressed();
                              if (respuesta) {
                                GetStorages.inst.onboarding = false;
                                Get.offAllNamed('/navigation-bar');
                              }
                            },
                            padding: EdgeInsets.all(13.0),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
