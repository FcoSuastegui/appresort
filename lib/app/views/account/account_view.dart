import 'package:appresort/app/views/account/components/account_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountView extends StatelessWidget {
  const AccountView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "account".tr,
        ),
      ),
      body: AccountBody(),
    );
  }
}
