import 'package:appresort/app/utils/get_storage.dart';
import 'package:appresort/app/utils/iconos.dart';
import 'package:appresort/app/themes/app_theme.dart';
import 'package:appresort/app/views/notification/controller/notification_controller.dart';
import 'package:appresort/app/widgets/Appbars/app_bar_default.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationContentView extends GetView<NotificationController> {
  static final String routeName = '/notification-content';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarDefault(
        title: Text("${controller.notification.titulo}"),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 10.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Iconos.nombre(
                        nombre: controller.notification.icono,
                        size: 100.0,
                        color: AppTheme.kSecondColor,
                      ),
                    ),
                    SizedBox(height: 30.0),
                    Text(
                      "Hola ${GetStorages.i.user.name}",
                      style: TextStyle(fontSize: 15.0),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                margin: EdgeInsets.only(bottom: 50.0),
                child: Text(
                  "${controller.notification.descripcion}",
                  textAlign: TextAlign.center,
                ),
              ),
              controller.notification.pagina.isNotEmpty
                  ? RaisedButton(
                      onPressed: () => print(controller.notification.pagina),
                      child: Container(
                        child: Text('Ir a la página'),
                        padding: EdgeInsets.symmetric(
                          horizontal: 80.0,
                          vertical: 15.0,
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      elevation: 0.0,
                      color: AppTheme.kPrimaryColor,
                      textColor: Colors.white,
                    )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }
}
