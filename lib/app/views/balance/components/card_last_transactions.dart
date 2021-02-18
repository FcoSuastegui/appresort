import 'package:appresort/app/data/models/last_transactions.dart';
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
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(
          horizontal: 10,
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Text(
                transation.concepto,
                style: TextStyle(
                  color: Colors.black.withOpacity(0.8),
                ),
              ),
            ),
            Container(
              child: Text(
                transation.metodo.isNotEmpty ? "(${transation.metodo})" : '',
                style: TextStyle(
                  color: Colors.black.withOpacity(0.8),
                ),
              ),
            ),
            Container(
              child: transation.esCargo
                  ? Text(
                      "\$ - ${transation.cargo}",
                      style: TextStyle(color: Colors.red),
                    )
                  : Text(
                      "\$ ${transation.abono}",
                      style: TextStyle(color: Colors.green),
                    ),
            )
          ],
        ),
        subtitle: Row(
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
                transation.fecha,
                style: TextStyle(
                  color: Colors.black.withOpacity(0.8),
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
      ),
    );
  }
}
