import 'package:appresort/app/src/views/notification/components/notification_list.dart';
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
          : NotificationList(),
    );
  }
}
