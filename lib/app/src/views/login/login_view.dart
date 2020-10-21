import 'package:appresort/app/src/themes/size_config.dart';
import 'package:appresort/app/src/views/login/components/login_body.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  static final String routeName = '/';
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: LoginBody(),
      ),
    );
  }
}
