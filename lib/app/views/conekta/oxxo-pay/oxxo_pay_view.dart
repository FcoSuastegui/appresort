import 'package:appresort/app/views/conekta/oxxo-pay/components/oxxo_pay_form.dart';
import 'package:appresort/app/widgets/Appbars/app_bar_default.dart';
import 'package:flutter/material.dart';

class OxxoPayView extends StatelessWidget {
  static final String routeName = '/oxxo-pay';
  const OxxoPayView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefault(
        title: Text("Oxxo Pay"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: OxxoPayForm(),
      ),
    );
  }
}
