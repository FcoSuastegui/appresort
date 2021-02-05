import 'package:appresort/app/globals/controller/scroll_bar_controller.dart';
import 'package:appresort/app/views/home/components/home_body.dart';
import 'package:flutter/material.dart';
import 'package:appresort/app/views/home/components/home_header.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  static final String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    final ScrollController scroll = Get.find<ScrollBarController>().scroll;
    return Scaffold(
      extendBody: true,
      body: SingleChildScrollView(
        controller: scroll,
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeHeader(),
              HomeBody(),
            ],
          ),
        ),
      ),
    );
  }
}
