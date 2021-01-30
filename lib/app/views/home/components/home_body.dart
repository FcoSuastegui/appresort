import 'package:appresort/app/views/home/components/home_know.dart';
import 'package:appresort/app/views/home/components/home_direct_access.dart';
import 'package:appresort/app/views/home/controllers/home_controller.dart';
import 'package:appresort/app/widgets/Linner/linner_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeBody extends GetView<HomeController> {
  const HomeBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.85,
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const HomeKnow(),
          const LinnerContainer(
            left: 0.0,
            right: 0.0,
            width: 0.30,
          ),
          const SizedBox(
            height: 10,
          ),
          const HomeDirectAccess(),
        ],
      ),
    );
  }
}
