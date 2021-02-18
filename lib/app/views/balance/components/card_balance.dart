import 'package:appresort/app/data/models/balance_saldos_model.dart';
import 'package:appresort/app/routes/routes.dart';
import 'package:appresort/app/themes/adapt.dart';
import 'package:appresort/app/themes/app_theme.dart';
import 'package:appresort/app/utils/helper.dart';
import 'package:appresort/app/utils/my_icons.dart';
import 'package:appresort/app/views/balance/controller/balance_controller.dart';
import 'package:appresort/app/widgets/Fields/drop_search_field.dart';
import 'package:appresort/app/widgets/Loading/loading.dart';
import 'package:appresort/app/widgets/PdfViewer/pdf_viewer.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardBalance extends StatelessWidget {
  final BalanceSaldoModel balance;
  const CardBalance({
    Key key,
    this.balance,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final c = Get.find<BalanceController>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10.0),
              margin: EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 1,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.0),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 3.0,
                    color: Colors.grey[400],
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                    alignment: Alignment.bottomRight,
                    child: RichText(
                      text: TextSpan(
                        text: 'Saldo actual: ',
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                          fontWeight: FontWeight.bold,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: '${Helper.moneyFormat(balance.total)}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Text(
                      "Saldos",
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Column(
                      children: List.generate(balance.saldos.length, (index) {
                        final saldo = balance.saldos[index];
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("º ${saldo.concepto}"),
                            Text(
                              "\$ ${saldo.saldo}",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        );
                      }),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Text(
                      "Fondos",
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Column(
                      children: List.generate(balance.fondos.length, (index) {
                        final fondo = balance.fondos[index];
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("º ${fondo.fondo}"),
                            Text(
                              "\$ ${fondo.saldo}",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        );
                      }),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            Container(
              height: Adapt.px(110),
              width: Adapt.px(110),
              child: CircleAvatar(
                backgroundColor: AppTheme.kPrimaryColor,
                child: Center(
                  child: MyIcons.name(
                    name: 'balance_scale',
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 2,
              child: DottedBorder(
                color: AppTheme.kPrimaryColor,
                strokeWidth: 1,
                radius: Radius.circular(
                  Adapt.px(90),
                ),
                child: GestureDetector(
                  onTap: () async {
                    Get.dialog(
                      ApleeksModal(),
                      barrierDismissible: false,
                      barrierColor: Colors.transparent.withOpacity(0.3),
                    );
                    /* LoadingDialog.show(context);
                    String file = await c.getBankStatement();
                    LoadingDialog.hide(context);
                    Get.to(
                      PdfViewer(path: file, title: 'Estado de cuenta'),
                      fullscreenDialog: true,
                    ); */
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 7.0,
                          color: Colors.grey.withOpacity(0.3),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyIcons.name(name: "payment"),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          child: Text(
                            'Estado de cuenta',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: Adapt.px(25),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              flex: 2,
              child: DottedBorder(
                color: AppTheme.kPrimaryColor,
                strokeWidth: 1,
                radius: Radius.circular(
                  Adapt.px(90),
                ),
                borderType: BorderType.Rect,
                child: GestureDetector(
                  onTap: () => Routes.goToPage("/pago-linea"),
                  child: Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyIcons.name(name: "download_sharp"),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Pago en línea',
                          style: TextStyle(
                            fontSize: Adapt.px(25),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class ApleeksModal extends StatelessWidget {
  const ApleeksModal({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Center(
        child: Text(
          "Estado de cuenta",
          style: TextStyle(
            color: Colors.black.withOpacity(0.6),
            fontWeight: FontWeight.bold,
            fontSize: Adapt.px(35),
          ),
        ),
      ),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.1,
              width: double.infinity,
              child: Material(
                child: DropSearchField(
                  showClearButton: false,
                  label: " Seleccione una servicio",
                  items: [
                    '2000',
                    '2001',
                    '2002',
                    '2003',
                    '2004',
                    '2005',
                    '2006',
                    '2007',
                    '2008',
                    '2009',
                    '2010',
                    '2011',
                    '2012',
                    '2013',
                    '2014',
                    '2015',
                    '2016',
                    '2017',
                    '2018',
                    '2019',
                    '2020',
                    '2021',
                  ],
                  onChanged: (String v) {},
                ),
              ),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        CupertinoDialogAction(
          isDefaultAction: true,
          child: Text(
            'Aceptar',
          ),
          onPressed: () {},
        ),
        CupertinoDialogAction(
          child: Text(
            'Cerrar',
          ),
          onPressed: () => Navigator.pop(context),
        )
      ],
    );
  }
}
