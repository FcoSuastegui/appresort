import 'package:appresort/app/src/helpers/get_storage.dart';
import 'package:appresort/app/src/routes/routes.dart';
import 'package:appresort/app/src/views/setting/components/setting_header.dart';
import 'package:appresort/app/src/widgets/Alerts/alert_actions.dart';
import 'package:appresort/app/src/widgets/ListTile/list_tile_default.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingBody extends StatelessWidget {
  const SettingBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SettingHeader(),
        SizedBox(height: Get.height * 0.05),
        Expanded(
          child: Container(
            width: Get.width,
            padding: EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  ListTileDefault(
                    text: 'Mi perfil',
                    trailing: Icons.arrow_forward,
                    onPress: () => Routes.inst.goToPage("/profile"),
                  ),
                  ListTileDefault(
                    top: 10.0,
                    text: 'Cambiar contraseña',
                    trailing: Icons.lock,
                    onPress: () => Routes.inst.goToPage("/password"),
                  ),
                  ListTileDefault(
                    top: 10.0,
                    text: 'Cerrar sesión',
                    trailing: Icons.exit_to_app,
                    onPress: () async => await logout(),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Future<void> logout() async {
    await Get.dialog(
      AlertAction(
        title: "¿Deseas salir de la aplicación?",
        onPress: () async {
          await GetStorages.inst.clear();
          GetStorages.inst.onboarding = true;
          Get.offAllNamed('/');
        },
      ),
    );
  }
}
