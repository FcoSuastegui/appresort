import 'package:appresort/app/src/views/home/components/home_body.dart';
import 'package:appresort/app/src/views/home/components/home_header.dart';
import 'package:appresort/app/src/views/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  static final String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController.instance,
      builder: (controller) => Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: 0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                HomeHeader(),
                HomeBody(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
