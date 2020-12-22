import 'package:appresort/app/routes/routes.dart';
import 'package:appresort/app/widgets/ListTile/list_tile_default.dart';
import 'package:flutter/material.dart';
import 'package:appresort/app/widgets/Appbars/app_bar_default.dart';

class ServicesView extends StatelessWidget {
  static final String routeName = '/services';
  const ServicesView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefault(title: Text("Servicios")),
      body: Container(
        margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0),
        child: ListView(
          padding: EdgeInsets.only(top: 0.0),
          shrinkWrap: true,
          children: [
            ListTileDefault(
              text: 'Pago en línea',
              trailing: Icons.payment,
              bottom: 10.0,
              onPress: () => Routes.inst.goToPage('/listar-cargos'),
            ),
          ],
        ),
      ),
    );
  }
}
