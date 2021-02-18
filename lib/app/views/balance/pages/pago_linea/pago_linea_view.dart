import 'package:appresort/app/data/models/charges_model.dart';
import 'package:appresort/app/routes/routes.dart';
import 'package:appresort/app/themes/adapt.dart';
import 'package:appresort/app/themes/app_theme.dart';
import 'package:appresort/app/utils/helper.dart';
import 'package:appresort/app/views/balance/pages/pago_linea/controller/pago_linea_controller.dart';
import 'package:appresort/app/widgets/Cards/card_refresh.dart';
import 'package:appresort/app/widgets/Sliver/sliver_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class PagoLineaView extends GetView<PagoLineaController> {
  static final String routeName = '/pago-linea';
  const PagoLineaView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mis cargos"),
      ),
      body: SliverScrollView(
        onRefresh: () => Future.sync(
          () => controller.pagingController.refresh(),
        ),
        slivers: [
          PagedSliverList.separated(
            pagingController: controller.pagingController,
            builderDelegate: PagedChildBuilderDelegate<ChargesModel>(
              itemBuilder: (context, charge, index) => CardCharge(
                charge: charge,
              ),
              firstPageErrorIndicatorBuilder: (context) => CardRefresh(
                title: Text("Hubo un error al cargar la información"),
              ),
              noItemsFoundIndicatorBuilder: (context) => CardRefresh(
                title: Text("No hay informcación disponibles"),
              ),
            ),
            separatorBuilder: (context, index) => SizedBox(
              height: Adapt.px(0),
            ),
          ),
        ],
      ),
    );
  }
}

class CardCharge extends StatelessWidget {
  final ChargesModel charge;
  const CardCharge({
    Key key,
    this.charge,
  })  : assert(charge != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                left: 10,
                right: 10,
                top: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Text(
                      charge.concepto,
                      style: TextStyle(
                        fontSize: Adapt.px(25),
                        color: Colors.black.withOpacity(0.6),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      charge.unidad,
                      style: TextStyle(
                        fontSize: Adapt.px(25),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Text(
                      charge.tipo,
                      style: TextStyle(
                        fontSize: Adapt.px(25),
                        color: Colors.black.withOpacity(0.6),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      "\$-${charge.cargo}",
                      style: TextStyle(
                        fontSize: Adapt.px(25),
                        color: Colors.red.withOpacity(0.6),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Text(
                      "Monto abonado",
                      style: TextStyle(
                        fontSize: Adapt.px(25),
                        color: Colors.black.withOpacity(0.6),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      "\$${charge.montoAbonado}",
                      style: TextStyle(
                        fontSize: Adapt.px(25),
                        color: Colors.green.withOpacity(0.6),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Divider(),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Text(
                      "Total a abonar",
                      style: TextStyle(
                        fontSize: Adapt.px(25),
                        color: Colors.black.withOpacity(0.6),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      Helper.moneyFormat(charge.total),
                      style: TextStyle(
                        fontSize: Adapt.px(25),
                        color: Colors.black.withOpacity(0.6),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.end,
              children: [
                FlatButton(
                  color: AppTheme.kPrimaryColor,
                  onPressed: () {
                    Get.find<PagoLineaController>().select(charge);
                    Routes.goToPage('/payments');
                  },
                  child: const Text(
                    'Abonar',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
