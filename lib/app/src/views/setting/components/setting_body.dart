import 'package:appresort/app/src/helpers/get_storage.dart';
import 'package:appresort/app/src/routes/routes.dart';
import 'package:appresort/app/src/themes/app_theme.dart';
import 'package:appresort/app/src/widgets/Alerts/alert_actions.dart';
import 'package:appresort/app/src/widgets/Linner/linner_container.dart';
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
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 15, left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(right: 0, top: 0),
                      padding: EdgeInsets.all(1.0),
                      child: CircleAvatar(
                        radius: 40.0,
                        backgroundColor: Colors.white,
                        backgroundImage: NetworkImage(
                          GetStorages.inst.avatar,
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white, // border color
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 6.0,
                            color: Colors.white.withOpacity(.2),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.only(top: 0.0, left: 10.0),
                            child: Text(
                              GetStorages.inst.nombreCompleto,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: AppTheme.kTextColor,
                                fontSize: 15.0,
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.only(top: 10.0, left: 10.0),
                            child: Text(
                              GetStorages.inst.correo,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: AppTheme.kTextColor,
                                fontSize: 15.0,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
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
                  LinnerContainer(top: 5.0),
                  ListTileDefault(
                    text: 'Cambiar contraseña',
                    trailing: Icons.lock,
                    onPress: () => Routes.inst.goToPage("/password"),
                  ),
                  LinnerContainer(top: 5.0),
                  ListTileDefault(
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
