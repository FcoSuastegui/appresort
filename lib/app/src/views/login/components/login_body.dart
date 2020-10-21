import 'package:appresort/app/src/views/login/components/login_form.dart';
import 'package:appresort/app/src/widgets/Informacion/informacion.dart';
import 'package:flutter/material.dart';

class LoginBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[Informacion.banner],
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: LoginForm(),
          ),
        ],
      ),
    );
  }
}
