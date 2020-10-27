import 'package:appresort/app/src/views/notification/components/notification_body.dart';
import 'package:appresort/app/src/views/notification/controller/notification_controller.dart';
import 'package:appresort/app/src/widgets/Appbars/app_bar_default.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefault(
        title: Text("Notificaciones"),
      ),
      body: GetBuilder<NotificationController>(
        init: NotificationController.instance,
        builder: (_) => SafeArea(
          child: NotificationBody(),
        ),
      ),
    );
  }
}
