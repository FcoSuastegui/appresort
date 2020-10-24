import 'package:appresort/app/src/views/publicacion/components/publicacion_card.dart';
import 'package:appresort/app/src/views/publicacion/controller/publicacion_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PublicacionContent extends GetView<Publicacioncontroller> {
  const PublicacionContent({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(top: 0.0),
      shrinkWrap: false,
      children: List.generate(
        controller.publicaciones.length,
        (index) {
          GlobalKey keyPublicaciones = new GlobalKey(
            debugLabel: index.toString(),
          );
          return PublicacionCard(
            publicacion: controller.publicaciones[index],
            keyPublicacion: keyPublicaciones,
            onTap: () {
              controller.captureAndSharePng(key: keyPublicaciones);
            },
          );
        },
      ),
    );
  }
}
