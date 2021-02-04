import 'package:appresort/app/themes/adapt.dart';
import 'package:appresort/app/views/login/components/login_body.dart';
import 'package:appresort/app/widgets/ScrollBar/scroll_bar_view.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  static final String routeName = '/';
  @override
  Widget build(BuildContext context) {
    Adapt.initContext(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: ScrollBarView(
        child: SingleChildScrollView(
          child: LoginBody(),
        ),
      ),
    );
  }
}
