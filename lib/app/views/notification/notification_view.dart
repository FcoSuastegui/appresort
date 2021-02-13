import 'package:appresort/app/data/models/notification_model.dart';
import 'package:appresort/app/routes/routes.dart';
import 'package:appresort/app/themes/adapt.dart';
import 'package:appresort/app/themes/app_theme.dart';
import 'package:appresort/app/views/notification/controller/notification_controller.dart';
import 'package:appresort/app/widgets/Cards/card_refresh.dart';
import 'package:appresort/app/widgets/Sliver/sliver_scroll_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class NotificationView extends GetView<NotificationController> {
  static final String routeName = '/notifications';
  const NotificationView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: Text(
            "notifications".tr,
          ),
        ),
        body: SliverScrollView(
          onRefresh: () => Future.sync(
            () => controller.pagingController.refresh(),
          ),
          slivers: [
            PagedSliverList.separated(
              pagingController: controller.pagingController,
              builderDelegate: PagedChildBuilderDelegate<NotificationModel>(
                itemBuilder: (context, notification, index) => _NotificationView(
                  notification: notification,
                  controller: controller,
                ),
                firstPageErrorIndicatorBuilder: (context) => CardRefresh(
                  title: Column(
                    children: [
                      Icon(
                        Icons.notifications,
                        color: Colors.black.withOpacity(0.7),
                        size: 30,
                      ),
                      Text("No hay notificaciones disponibles"),
                    ],
                  ),
                ),
                noItemsFoundIndicatorBuilder: (context) => CardRefresh(
                  title: Column(
                    children: [
                      Icon(
                        Icons.notifications,
                        color: Colors.black.withOpacity(0.7),
                        size: 50,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text("No hay notificaciones disponibles"),
                    ],
                  ),
                ),
              ),
              separatorBuilder: (context, index) => SizedBox(
                height: Adapt.px(10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NotificationView extends StatelessWidget {
  final NotificationModel notification;
  final NotificationController controller;
  const _NotificationView({
    Key key,
    this.notification,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      confirmDismiss: (DismissDirection direction) async {
        switch (direction) {
          case DismissDirection.vertical:
            return false;
            break;
          case DismissDirection.horizontal:
            return false;
            break;
          case DismissDirection.endToStart:
            return false;
            break;
          case DismissDirection.startToEnd:
            final bool response = await showDialog(
              barrierColor: Colors.transparent.withOpacity(0.2),
              barrierDismissible: false,
              context: context,
              builder: (BuildContext context) {
                return CupertinoAlertDialog(
                  title: Text(
                    "¿Deseas eliminar la notificatión?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: Adapt.px(30),
                      color: Colors.black.withOpacity(0.9),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  content: Text(
                    "Se eliminara esta notificatión de tu lista",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: Adapt.px(25),
                      color: Colors.black.withOpacity(0.9),
                    ),
                  ),
                  actions: <Widget>[
                    CupertinoDialogAction(
                      child: Text(
                        'cancel'.tr,
                      ),
                      onPressed: () => Navigator.of(context).pop(false),
                    ),
                    CupertinoDialogAction(
                      isDefaultAction: true,
                      child: Text(
                        'delete'.tr,
                      ),
                      onPressed: () async {
                        return Navigator.of(context).pop(true);
                      },
                    ),
                  ],
                );
              },
            );

            if (response) {
              await controller.delete(notification.id);
            }
            return response;
            break;
          case DismissDirection.up:
            return false;
            break;
          case DismissDirection.down:
            return false;
            break;
        }
        return false;
      },
      child: GestureDetector(
        onTap: () {
          controller.select(notification);
          Routes.goToPage("/notification-content");
        },
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          margin: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 8,
          ),
          child: Column(
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CircleAvatar(
                      radius: 12,
                      backgroundColor: Colors.white,
                      backgroundImage: CachedNetworkImageProvider(
                        notification.senderAvatar,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Text(
                        notification.sender,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: Adapt.px(28),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CircleAvatar(
                            radius: Adapt.px(8),
                            backgroundColor: notification.status ? Colors.green : Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        notification.title.isEmpty
                            ? SizedBox.shrink()
                            : Container(
                                child: Text(
                                  notification.title,
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(0.8),
                                  ),
                                ),
                              ),
                        SizedBox(
                          height: notification.title.isEmpty ? 0 : 5,
                        ),
                        notification.description.isEmpty
                            ? SizedBox.shrink()
                            : Container(
                                child: Text(
                                  notification.description,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(0.5),
                                  ),
                                ),
                              )
                      ],
                    ),
                  ),
                  Container(
                    child: Text(
                      notification.time,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: AppTheme.kPrimaryColor.withOpacity(0.9),
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
