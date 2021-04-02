import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingApleeks extends StatelessWidget {
  static void show(BuildContext context, {Key key}) => Get.dialog(
        LoadingApleeks(key: key),
        barrierDismissible: false,
        useRootNavigator: false,
      ).then((value) => FocusScope.of(context).requestFocus(FocusNode()));
  static void hide(BuildContext context) => Get.isDialogOpen ? Get.back() : null;

  LoadingApleeks({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Center(
        child: Card(
          shadowColor: Colors.transparent,
          elevation: 0.0,
          color: Colors.transparent,
          child: Container(
            width: 80,
            height: 80,
            padding: EdgeInsets.all(12.0),
            child: CircularProgressIndicator(
              strokeWidth: 3,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
