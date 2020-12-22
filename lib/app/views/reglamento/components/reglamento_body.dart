import 'package:appresort/app/views/reglamento/components/reglamento_list.dart';
import 'package:appresort/app/views/reglamento/controller/reglamento_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReglamentoBody extends GetView<ReglamentoController> {
  const ReglamentoBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Obx(
        () => controller.loading ? Center(child: CircularProgressIndicator()) : ReglamentoList(),
      ),
    );
  }
}
