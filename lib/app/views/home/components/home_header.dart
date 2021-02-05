import 'package:appresort/app/routes/routes.dart';
import 'package:appresort/app/themes/adapt.dart';
import 'package:appresort/app/themes/app_theme.dart';
import 'package:appresort/app/utils/get_storage.dart';
import 'package:appresort/app/views/notification/controller/notification_controller.dart';
import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = GetStorages.i.user;
    final n = Get.find<NotificationController>();
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: Adapt.px(30),
        vertical: Adapt.px(40),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Bienvenido de nuevo",
                    style: TextStyle(
                      fontSize: Adapt.px(25),
                      color: AppTheme.kPrimaryColor.withOpacity(0.9),
                    ),
                  ),
                  Text(
                    user.fullname,
                    style: TextStyle(
                      fontSize: Adapt.px(25),
                      color: AppTheme.kPrimaryColor.withOpacity(0.9),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => Routes.goToPage('/notifications'),
                    behavior: HitTestBehavior.translucent,
                    child: Badge(
                      badgeContent: Obx(
                        () => Text(
                          "${n.counter}",
                          style: TextStyle(
                            fontSize: Adapt.px(13),
                            color: Colors.white,
                          ),
                        ),
                      ),
                      child: Icon(
                        Icons.notifications,
                        color: AppTheme.kPrimaryColor.withOpacity(0.6),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: Adapt.px(30),
                  ),
                  user.photo != null && user.photo.isNotEmpty
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(
                            Adapt.px(5),
                          ), //or 15.0
                          child: Container(
                            height: Adapt.px(70),
                            width: Adapt.px(70),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: CachedNetworkImageProvider(
                                  GetStorages.i.user.photo,
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(
                            Adapt.px(5),
                          ), //or 15.0
                          child: Container(
                            height: Adapt.px(70),
                            width: Adapt.px(70),
                            child: Icon(
                              Icons.account_circle,
                              color: Colors.white,
                            ),
                          ),
                        ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
