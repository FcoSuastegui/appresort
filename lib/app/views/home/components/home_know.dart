import 'package:appresort/app/routes/routes.dart';
import 'package:appresort/app/themes/adapt.dart';
import 'package:appresort/app/themes/app_theme.dart';
import 'package:appresort/app/views/home/controllers/home_controller.dart';
import 'package:appresort/app/widgets/ListTile/list_tile_custom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeKnow extends GetView<HomeController> {
  const HomeKnow({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Accesos directos:',
          style: TextStyle(
            color: AppTheme.kTextColor,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        ListTileCustom(
          title: 'Publicaciones',
          height: Adapt.px(100),
          icon: Icon(
            Icons.book,
            color: Colors.white,
          ),
          backgroundicon: AppTheme.kPrimaryColor,
          onPressed: () => Routes.goToPage("/publicacion"),
          iconPressColor: AppTheme.kPrimaryColor,
        ),
        SizedBox(
          height: 10,
        ),
        ListTileCustom(
          title: 'Servicios',
          height: Adapt.px(100),
          icon: Icon(
            Icons.room_service,
            color: Colors.white,
          ),
          backgroundicon: AppTheme.kPrimaryColor,
          onPressed: () => Routes.goToPage("/services"),
          iconPressColor: AppTheme.kPrimaryColor,
        ),
        SizedBox(
          height: 10,
        ),
        ListTileCustom(
          title: 'Tickets',
          height: Adapt.px(100),
          icon: Icon(
            Icons.headset_mic,
            color: Colors.white,
          ),
          backgroundicon: AppTheme.kPrimaryColor,
          onPressed: () => Routes.goToPage("/ticket"),
          iconPressColor: AppTheme.kPrimaryColor,
        ),
        SizedBox(
          height: 10,
        ),
        ListTileCustom(
          title: 'Encuesta',
          height: Adapt.px(100),
          icon: Icon(
            Icons.live_help,
            color: Colors.white,
          ),
          backgroundicon: AppTheme.kPrimaryColor,
          iconPressColor: AppTheme.kPrimaryColor,
          onPressed: () => Routes.goToPage(""),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
