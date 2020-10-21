import 'package:appresort/app/src/views/login/components/login_body.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  static final String routeName = '/';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: LoginBody(),
      ),
    );
  }
}
