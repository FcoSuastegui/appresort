import 'package:appresort/app/views/password/components/password_form.dart';
import 'package:flutter/material.dart';
import 'package:appresort/app/widgets/Appbars/app_bar_default.dart';

class PassWordView extends StatelessWidget {
  static final String routeName = '/password';
  const PassWordView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBarDefault(title: Text("Cambiar contraseña")), body: PasswordForm());
  }
}
