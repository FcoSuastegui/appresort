import 'package:appresort/app/views/saldos/components/saldos_body.dart';
import 'package:appresort/app/views/saldos/controller/saldo_controller.dart';
import 'package:appresort/app/widgets/Appbars/app_bar_default.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SaldosView extends GetView<SaldoController> {
  static final String routeName = '/saldo';
  const SaldosView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefault(
        title: Text("Mi saldo"),
      ),
      body: Obx(
        () => controller.loading ? Center(child: CircularProgressIndicator()) : SaldosBody(),
      ),
    );
  }
}
