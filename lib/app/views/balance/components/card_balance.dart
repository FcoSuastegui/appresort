import 'package:appresort/app/data/models/balance_saldos_model.dart';
import 'package:appresort/app/themes/adapt.dart';
import 'package:appresort/app/themes/app_theme.dart';
import 'package:appresort/app/utils/helper.dart';
import 'package:appresort/app/utils/my_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardBalance extends StatelessWidget {
  final BalanceSaldoModel balance;
  const CardBalance({
    Key key,
    this.balance,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    child: balance.fondos.length > 0
                        ? Column(
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
                          )
                        : Center(child: Text("No hay fondos disponibles")),
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
                    child: balance.fondos.length > 0
                        ? Column(
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
                          )
                        : Center(child: Text("No hay fondos disponibles")),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            Container(
              height: Adapt.px(120),
              width: Adapt.px(150),
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
      ],
    );
  }
}
