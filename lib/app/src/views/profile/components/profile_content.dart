import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:appresort/app/src/views/profile/controller/profile_controller.dart';

class ProfileContent extends GetView<ProfileController> {
  const ProfileContent({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final perfil = controller.perfil;
    return Column(
      children: <Widget>[
        ListTile(
          title: Text("Información personal"),
        ),
        Divider(),
        ListTile(
          title: Text("Nombre completo"),
          subtitle: Text(perfil.nombre),
        ),
        ListTile(
          title: Text("Usuario"),
          subtitle: Text(perfil.usuario),
        ),
        ListTile(
          title: Text("Correo"),
          subtitle: Text(perfil.correo),
        ),
        ListTile(
          title: Text("RFC"),
          subtitle: Text(perfil.rfc),
        ),
        ListTile(
          title: Text("NSS"),
          subtitle: Text(perfil.nss),
        ),
        ListTile(
          title: Text("Número de credito"),
          subtitle: Text(perfil.numCredito),
        ),
      ],
    );
  }
}
