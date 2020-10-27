import 'package:appresort/app/src/views/notification/components/notification_card.dart';
import 'package:appresort/app/src/views/notification/controller/notification_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationBody extends GetView<NotificationController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.loading.value
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              margin: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
              child: ListView(
                children: List.generate(
                  controller.notifications.length,
                  (index) => NotificationCard(
                    notificacion: controller.notifications[index],
                    onTap: () {
                      controller
                          .selectNotification(controller.notifications[index]);
                      Get.toNamed('/notification-content');
                    },
                  ),
                ),
              ),
            ),
    );
  }
}
