import 'package:appresort/app/src/data/models/cargo_model.dart';
import 'package:appresort/app/src/routes/routes.dart';
import 'package:appresort/app/src/views/listar-cargos/components/listar_cargos.dart';
import 'package:appresort/app/src/views/listar-cargos/controller/listar_cargos_controller.dart';
import 'package:appresort/app/src/widgets/Informacion/no_information.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';

class ListarCargosBody extends GetView<ListarCargosController> {
  const ListarCargosBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        margin: EdgeInsets.only(
          left: 10.0,
          right: 10.0,
          top: 10.0,
          bottom: 10.0,
        ),
        child: controller.cargos.length > 0
            ? ListView(
                padding: EdgeInsets.only(top: 0.0),
                shrinkWrap: true,
                children: List.generate(
                  controller.cargos.length,
                  (index) {
                    final bool pagar = controller.cargos.length - 1 != index ||
                        controller.cargos.length == 1 ||
                        controller.cargos.length == 2;

                    return ListarCargos(
                      cargo: controller.cargos[index],
                      onTap: pagar
                          ? () async =>
                              await seleccionarCargo(controller.cargos[index])
                          : null,
                      available: pagar,
                    );
                  },
                ),
              )
            : NoInformationWidget(
                onPress: controller.obtenerCargos,
              ),
      ),
    );
  }

  Future<void> seleccionarCargo(CargoModel cargo) async {
    final TextStyle _label = TextStyle(fontSize: 14.0, color: Colors.grey);
    controller.cargoSeleccionado = cargo;
    await Get.dialog(
      Center(
        child: SizedBox(
          height: 250,
          child: Dialog(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Text(
                    "¿Seleccina el método de pago? ",
                    style: TextStyle(fontSize: 14.0, color: Colors.grey),
                  ),
                  Divider(),
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      Get.back();
                      Routes.inst.goToPage("/oxxo-pay");
                    },
                    child: Container(
                      width: Get.width,
                      height: 50.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Icon(FontAwesome5.money_bill_alt),
                          SizedBox(
                            width: 20.0,
                          ),
                          Text("Efectivo", style: _label)
                        ],
                      ),
                    ),
                  ),
                  Divider(),
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      Get.back();
                      Routes.inst.goToPage('/payment');
                    },
                    child: Container(
                      width: Get.width,
                      height: 50.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Icon(FontAwesome5.credit_card),
                          SizedBox(
                            width: 20.0,
                          ),
                          Text("Tarjeta de crédito o débito", style: _label)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
