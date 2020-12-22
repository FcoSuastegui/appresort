import 'package:appresort/app/views/setting/components/setting_body.dart';
import 'package:appresort/app/widgets/Appbars/app_bar_default.dart';
import 'package:flutter/material.dart';

class SettingView extends StatelessWidget {
  const SettingView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefault(
        title: Text("Configuracion"),
      ),
      body: SettingBody(),
    );
  }
}
