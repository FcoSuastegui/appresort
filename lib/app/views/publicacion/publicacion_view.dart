import 'package:appresort/app/views/publicacion/components/publicacion_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:appresort/app/widgets/Appbars/app_bar_default.dart';
import 'package:appresort/app/views/publicacion/controller/publicacion_controller.dart';

class PublicacionView extends GetView<Publicacioncontroller> {
  static final String routeName = '/publicacion';
  const PublicacionView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefault(
        title: Text("Publicaciones"),
      ),
      body: Obx(
        () => controller.loading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : PublicacionContent(),
      ),
    );
  }
}
