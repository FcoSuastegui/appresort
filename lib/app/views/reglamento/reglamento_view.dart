import 'package:appresort/app/views/reglamento/components/reglamento_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:appresort/app/views/reglamento/controller/reglamento_controller.dart';
import 'package:appresort/app/widgets/Appbars/app_bar_default.dart';

class ReglamentoView extends GetView<ReglamentoController> {
  static final String routeName = '/reglamento';
  const ReglamentoView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefault(
        title: Text("Reglamentos"),
      ),
      body: ReglamentoBody(),
    );
  }
}
