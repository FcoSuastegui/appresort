import 'package:appresort/app/src/views/notification/components/notification_card.dart';
import 'package:appresort/app/src/views/notification/controller/notification_controller.dart';
import 'package:appresort/app/src/widgets/Informacion/no_information.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationList extends GetView<NotificationController> {
  const NotificationList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 10.0,
        right: 10.0,
        top: 10.0,
        bottom: 10.0,
      ),
      child: controller.notifications.length > 0
          ? ListView(
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
            )
          : NoInformationWidget(
              onPress: controller.getNotification,
            ),
    );
  }
}
