import 'package:appresort/app/src/routes/routes.dart';
import 'package:appresort/app/src/widgets/Cards/card_default.dart';
import 'package:appresort/app/src/widgets/ListTile/list_tile_default.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  HomeController._internal();
  static HomeController _instance = HomeController._internal();
  static HomeController get instance => _instance;

  List<CardDefault> accesoRapido = [
    CardDefault(
      text: 'Reglamentos',
      icon: Icons.info,
      onPress: () => Routes.inst.goToPage('/reglamento'),
      left: 0.0,
    ),
    CardDefault(
      text: 'Asambleas',
      icon: Icons.gavel,
      onPress:() => Routes.inst.goToPage('page'),
    ),
    CardDefault(
      text: 'Saldos',
      icon: Icons.attach_money,
      onPress: () => Routes.inst.goToPage('/saldo'),
      right: 0.0,
    ),
  ];

  List<ListTileDefault> listItems = [
    ListTileDefault(
      text: 'Publicaciones',
      top: 10.0,
      bottom: 10.0,
      trailing: Icons.book,
      onPress: () => Routes.inst.goToPage("publicacion"),
    ),
    ListTileDefault(
      text: 'Servicios',
      bottom: 10.0,
      trailing: Icons.room_service,
      onPress: () => Routes.inst.goToPage("/services"),
    ),
    ListTileDefault(
      text: 'Tickets',
      bottom: 10.0,
      trailing: Icons.headset_mic,
      onPress: () => Routes.inst.goToPage("/ticket"),
    ),
    ListTileDefault(
      text: 'Encuesta',
      bottom: 10.0,
      trailing: Icons.live_help,
      onPress: () => Routes.inst.goToPage("ticket"),
    ),
  ];
}
