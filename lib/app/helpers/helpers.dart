import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class Helpers {
  static final Helpers _instancia = Helpers._internal();
  factory Helpers() => _instancia;
  Helpers._internal();

  static Future<void> launchInBrowser(String url) async {
    final bool available = await canLaunch(url);

    if (available) {
      await launch(url);
    } else {}
  }

  static Future<void> success({
    String title: 'App Resort',
    @required String message,
    int duration = 1500,
  }) async {
    if (!Get.isSnackbarOpen) {
      Get.snackbar(
        title,
        message,
        duration: Duration(milliseconds: duration),
        backgroundColor: Colors.green.withOpacity(0.8),
        colorText: Colors.white,
      );
    }
  }

  static Future<void> error({
    String title: 'App Resort',
    @required String message,
    int duration = 1500,
  }) async {
    if (!Get.isSnackbarOpen) {
      Get.snackbar(
        title,
        message,
        duration: Duration(milliseconds: duration),
        backgroundColor: Colors.red.withOpacity(0.8),
        colorText: Colors.white,
      );
    }
  }

  static Future<void> warning({
    String title: 'App Resort',
    @required String message,
    int duration = 1500,
  }) async {
    if (!Get.isSnackbarOpen) {
      Get.snackbar(
        title,
        message,
        duration: Duration(milliseconds: duration),
        backgroundColor: Colors.yellow.withOpacity(0.8),
        colorText: Colors.white,
      );
    }
  }
}
