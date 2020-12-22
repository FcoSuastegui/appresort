import 'package:appresort/app/data/models/cargo_model.dart';
import 'package:appresort/app/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ListarCargos extends StatelessWidget {
  final CargoModel cargo;
  final bool available;
  final Function onTap;

  const ListarCargos({
    Key key,
    this.cargo,
    this.available,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NumberFormat moneda = NumberFormat.simpleCurrency();
    return Card(
      shadowColor: AppTheme.kPrimaryColor,
      elevation: 0,
      child: Container(
        child: Column(
          children: <Widget>[
            ListTile(
              enabled: true,
              leading: Icon(Icons.payment, color: AppTheme.kPrimaryColor),
              title: Container(
                padding: EdgeInsets.all(0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Expanded(
                            flex: 2,
                            child: Text(
                              "${cargo.concepto}",
                              style: TextStyle(fontSize: 13.0),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              "${moneda.format(cargo.cargo)}",
                              style: TextStyle(fontSize: 13.0),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              subtitle: Container(
                padding: EdgeInsets.all(0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Expanded(
                            flex: 2,
                            child: Text(
                              "${cargo.mes} ",
                              style: TextStyle(fontSize: 13.0),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              "${cargo.anio} ",
                              style: TextStyle(fontSize: 13.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: Text(
                            "Total a pagar",
                            style: TextStyle(fontSize: 13.0),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            "${moneda.format(cargo.total)} ",
                            style: TextStyle(fontSize: 13.0),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            ButtonBar(
              children: <Widget>[
                GestureDetector(
                  onTap: onTap,
                  child: Container(
                    margin: EdgeInsets.only(bottom: 10.0),
                    width: Get.width * 0.3,
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        'PAGAR',
                        style: TextStyle(
                          color: available ? AppTheme.kPrimaryColor : Colors.grey,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            stops: [0.020, 0.015],
            colors: [AppTheme.kPrimaryColor, Colors.white],
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 3.0,
              color: Colors.grey[400],
            ),
          ],
          borderRadius: BorderRadius.all(
            Radius.circular(5.0),
          ),
          border: Border.all(width: 0.3, color: Colors.grey[200]),
        ),
      ),
    );
  }
}
