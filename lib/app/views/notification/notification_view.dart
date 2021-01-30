import 'dart:ui';

import 'package:appresort/app/data/models/notification_model.dart';
import 'package:appresort/app/globals/controller/scroll_bar_controller.dart';
import 'package:appresort/app/routes/routes.dart';
import 'package:appresort/app/themes/adapt.dart';
import 'package:appresort/app/utils/my_icons.dart';
import 'package:appresort/app/views/notification/controller/notification_controller.dart';
import 'package:appresort/app/widgets/Cards/card_refresh.dart';
import 'package:appresort/app/widgets/ListTile/list_tile_custom.dart';
import 'package:appresort/app/widgets/Sliver/sliver_app_bar_view.dart';
import 'package:appresort/app/widgets/Sliver/sliver_scroll_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScrollController scroll = Get.find<ScrollBarController>().scroll;
    return GetBuilder<NotificationController>(
      init: NotificationController.i,
      builder: (c) => Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.dark,
          child: SafeArea(
            bottom: false,
            child: SliverScrollAppBar(
              controller: scroll,
              onRefresh: () => Future.sync(
                () => c.pagingController.refresh(),
              ),
              maxHeight: Adapt.px(100),
              minHeight: Adapt.px(100),
              pinned: true,
              sliverAppBar: SliverAppBarView(
                title: Text(
                  "Notificaciones",
                  style: TextStyle(color: Colors.black45),
                ),
              ),
              slivers: [
                PagedSliverList.separated(
                  pagingController: c.pagingController,
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
                        icon: MyIcons.name(name: notification.icono),
                        onPressed: () {
                          c.selectNotification(notification);
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
        ),
      ),
    );
  }
}

// SliverScrollView
