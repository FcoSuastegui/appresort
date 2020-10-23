import 'package:appresort/app/src/views/listar-cargos/components/listar_cargos_body.dart';
import 'package:appresort/app/src/views/listar-cargos/controller/listar_cargos_controller.dart';
import 'package:appresort/app/src/widgets/Appbars/app_bar_default.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListarCargosView extends GetView<ListarCargosController> {
  static final String routeName = '/listar-cargos';
  const ListarCargosView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefault(
        title: Text("Pago en línea"),
      ),
      body: Obx(
        () => controller.loading
            ? Center(child: CircularProgressIndicator())
            : ListarCargosBody(),
      ),
    );
  }
}
