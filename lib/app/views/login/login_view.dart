import 'package:appresort/app/themes/adapt.dart';
import 'package:appresort/app/views/login/components/login_body.dart';
import 'package:appresort/app/widgets/ScrollBar/scroll_bar_view.dart';
import 'package:appresort/app/widgets/UnFocus/un_focus_form.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  static final String routeName = '/';
  @override
  Widget build(BuildContext context) {
    Adapt.initContext(context);
    return Scaffold(
      body: ScrollBarView(
        child: UnFocusForm(
          child: SingleChildScrollView(
            child: LoginBody(),
          ),
        ),
      ),
    );
  }
}
