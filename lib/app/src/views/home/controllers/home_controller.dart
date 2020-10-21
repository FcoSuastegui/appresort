import 'package:appresort/app/src/widgets/Cards/card_default.dart';
import 'package:appresort/app/src/widgets/ListTile/list_tile_default.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  List<CardDefault> accesoRapido = [
    CardDefault(
      text: 'Reglamentos',
      icon: Icons.info,
      onPress: () => Get.toNamed('reglamento'),
      left: 0.0,
    ),
    CardDefault(
      text: 'Asambleas',
      icon: Icons.gavel,
      onPress: () => Get.toNamed('asablea'),
    ),
    CardDefault(
      text: 'Saldos',
      icon: Icons.attach_money,
      onPress: () => Get.toNamed('saldo'),
      right: 0.0,
    ),
  ];

  List<ListTileDefault> listItems = [
    ListTileDefault(
      text: 'Publicaciones',
      top: 10.0,
      bottom: 10.0,
      trailing: Icons.book,
      onPress: () => Get.toNamed("publicacion"),
    ),
    ListTileDefault(
      text: 'Servicios',
      bottom: 10.0,
      trailing: Icons.room_service,
      onPress: () => Get.toNamed("servicio"),
    ),
    ListTileDefault(
      text: 'Tickets',
      bottom: 10.0,
      trailing: Icons.headset_mic,
      onPress: () => Get.toNamed("ticket"),
    ),
    ListTileDefault(
      text: 'Encuesta',
      bottom: 10.0,
      trailing: Icons.live_help,
    ),
  ];
}
