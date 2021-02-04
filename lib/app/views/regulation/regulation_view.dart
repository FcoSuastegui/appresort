import 'package:appresort/app/views/regulation/controller/regulation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegulationView extends GetView<RegulationController> {
  static final String routeName = '/regulations';
  const RegulationView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Reglamentos",
        ),
      ),
      body: Container(),
    );
  }
}
