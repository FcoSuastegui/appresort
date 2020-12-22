import 'package:appresort/app/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:appresort/app/data/models/publicacion_model.dart';
import 'package:appresort/app/data/services/publicacion_service.dart';
import 'package:appresort/app/helpers/get_storage.dart';

import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'dart:typed_data';
import 'dart:ui';

class Publicacioncontroller extends GetxController {
  Publicacioncontroller._internal();
  static Publicacioncontroller _instance = Publicacioncontroller._internal();
  static Publicacioncontroller get instance => _instance;

  RxList<PublicacionModel> _publicaciones = List<PublicacionModel>().obs;
  RxList<PublicacionModel> get publicaciones => _publicaciones;

  RxBool _loading = false.obs;
  bool get loading => _loading.value;

  @override
  void onInit() {
    listarPublicaciones();
    super.onInit();
  }

  Future<void> listarPublicaciones() async {
    _loading(true);
    final response = await PublicacionService.inst.publicaciones(
      idusuario: GetStorages.inst.idusuario,
      sistema: GetStorages.inst.sistema,
    );
    _publicaciones.clear();
    if (response.status) {
      response.data.forEach(
        (item) => _publicaciones.add(
          PublicacionModel.fromJson(item),
        ),
      );
    }
    _loading(false);
  }

  Future captureAndSharePng({GlobalKey key}) async {
    try {
      RenderRepaintBoundary boundary = key.currentContext.findRenderObject();
      var image = await boundary.toImage();
      ByteData byteData = await image.toByteData(format: ImageByteFormat.png);
      Uint8List pngBytes = byteData.buffer.asUint8List();
      await Share.file(
        'Publicaciones',
        'share_publicaciones.png',
        pngBytes,
        'image/png',
      );
    } catch (e) {
      Helpers.error(message: e.toString());
    }
  }
}
