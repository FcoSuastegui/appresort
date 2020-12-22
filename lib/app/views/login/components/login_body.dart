import 'package:appresort/app/views/login/components/login_footer.dart';
import 'package:appresort/app/views/login/components/login_form.dart';
import 'package:appresort/app/widgets/Informacion/informacion.dart';
import 'package:flutter/material.dart';

class LoginBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[Informacion.banner],
          ),
          LoginForm(),
          LoginFooter(),
        ],
      ),
    );
  }
}
