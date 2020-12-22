import 'package:appresort/app/views/reglamento/components/reglamento_card.dart';
import 'package:appresort/app/views/reglamento/controller/reglamento_controller.dart';
import 'package:appresort/app/widgets/Informacion/no_information.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReglamentoList extends GetView<ReglamentoController> {
  const ReglamentoList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.reglamentos.length > 0
        ? ListView(
            padding: EdgeInsets.only(top: 0.0),
            shrinkWrap: false,
            children: List.generate(
              controller.reglamentos.length,
              (index) => ReglamentoCard(
                reglamento: controller.reglamentos[index],
              ),
            ),
          )
        : NoInformationWidget(onPress: controller.getReglamentos);
  }
}
