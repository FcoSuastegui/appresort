import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:appresort/app/src/views/reglamento/controller/reglamento_controller.dart';
import 'package:appresort/app/src/widgets/Appbars/app_bar_default.dart';
import 'package:appresort/app/src/widgets/PdfViewer/pdfViewer.dart';

class ReglamentoView extends GetView<ReglamentoController> {
  static final String routeName = '/reglamento';
  const ReglamentoView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefault(
        title: Text("Reglamento"),
      ),
      body: Obx(
        () => controller.loading
            ? Center(child: CircularProgressIndicator())
            : PdfViewerWidget(path: controller.url),
      ),
    );
  }
}
