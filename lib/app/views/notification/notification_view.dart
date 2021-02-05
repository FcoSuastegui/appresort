import 'package:appresort/app/data/models/notification_model.dart';
import 'package:appresort/app/routes/routes.dart';
import 'package:appresort/app/themes/adapt.dart';
import 'package:appresort/app/utils/my_icons.dart';
import 'package:appresort/app/views/notification/controller/notification_controller.dart';
import 'package:appresort/app/widgets/Cards/card_refresh.dart';
import 'package:appresort/app/widgets/ListTile/list_tile_custom.dart';
import 'package:appresort/app/widgets/Sliver/sliver_scroll_view.dart';
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
                itemBuilder: (context, notification, index) => Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Adapt.px(20),
                    vertical: Adapt.px(10),
                  ),
                  child: ListTileCustom(
                    backgroundicon: Colors.indigo,
                    title: notification.titulo,
                    subtitle: notification.descripcion,
                    icon: MyIcons.name(
                      name: notification.icono,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      controller.selectNotification(notification);
                      Routes.goToPage("/notification-content");
                    },
                  ),
                ),
                firstPageErrorIndicatorBuilder: (context) => CardRefresh(
                  title: Text("No hay notificaciones disponibles"),
                ),
                noItemsFoundIndicatorBuilder: (context) => CardRefresh(
                  title: Text("No hay notificaciones disponibles"),
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

// SliverScrollView
