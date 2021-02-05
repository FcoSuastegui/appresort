import 'package:appresort/app/views/password/components/password_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class PassWordView extends StatelessWidget {
  static final String routeName = '/password';
  const PassWordView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "change-password".tr,
        ),
      ),
      body: PasswordForm(),
    );
  }
}
