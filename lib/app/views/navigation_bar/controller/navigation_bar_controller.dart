import 'package:appresort/app/views/home/home_view.dart';
import 'package:appresort/app/views/notification/notification_view.dart';
import 'package:appresort/app/views/setting/setting_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationBarController extends GetxController {
  NavigationBarController._internal();
  static NavigationBarController _instance = NavigationBarController._internal();
  static NavigationBarController get inst => _instance;

  RxInt _index = 0.obs;
  int get index => _index.value;

  void selectIndex(int index) => _index.value = index;

  @override
  void onInit() {
    _index.value = 0;
    super.onInit();
  }

  List<Widget> page = [
    HomeView(),
    NotificationView(),
    SettingView(),
  ];
}
