import 'package:appresort/app/data/models/last_transactions.dart';
import 'package:appresort/app/themes/adapt.dart';
import 'package:appresort/app/utils/my_icons.dart';
import 'package:flutter/material.dart';

class CardLastTransactions extends StatelessWidget {
  final LastTransations transation;

  const CardLastTransactions({
    Key key,
    this.transation,
  })  : assert(transation != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 10,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text(
                  "Departamento",
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.8),
                    fontSize: Adapt.px(27),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                child: Text(
                  transation.unidad,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.8),
                    fontSize: Adapt.px(27),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text(
                  transation.concepto,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.8),
                    fontSize: Adapt.px(27),
                  ),
                ),
              ),
              Container(
                child: Text(
                  transation.fecha,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.8),
                    fontSize: Adapt.px(23),
                  ),
                ),
              ),
              Container(
                child: transation.esCargo
                    ? Text(
                        "\$ - ${transation.cargo}",
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: Adapt.px(25),
                        ),
                      )
                    : Text(
                        "\$ ${transation.abono}",
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: Adapt.px(25),
                        ),
                      ),
              )
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Text(
                  transation.tipoConcepto,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
              ),
              Container(
                child: Text(
                  transation.metodo.isNotEmpty ? "(${transation.metodo})" : '',
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.8),
                    fontSize: Adapt.px(25),
                  ),
                ),
              ),
              Container(
                child: transation.esCargo
                    ? MyIcons.name(name: 'trending_down', color: Colors.red)
                    : MyIcons.name(name: 'trending_up', color: Colors.green),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
