import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class Helper {
  static final Helper _instancia = Helper._internal();
  factory Helper() => _instancia;
  Helper._internal();

  static Future<void> launchInBrowser(String url) async {
    url.isURL
        ? await canLaunch(url)
            ? await launch(url, forceSafariVC: false)
            : Helper.error(message: 'No se pudo acceder a esta url $url')
        : Helper.error(message: 'Favor de ingresar una url valida');
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
