import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScrollBarController extends GetxController {
  ScrollBarController._internal();
  static ScrollBarController _instance = ScrollBarController._internal();
  static ScrollBarController get i => _instance;

  final ScrollController scroll = ScrollController();

  @override
  void onInit() {
    super.onInit();
  }
}
