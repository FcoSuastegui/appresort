import 'package:appresort/app/src/data/models/reglamento_model.dart';
import 'package:appresort/app/src/helpers/get_storage.dart';
import 'package:appresort/app/src/widgets/ListTile/list_tile_default.dart';
import 'package:appresort/app/src/widgets/PdfViewer/pdf_viewer_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReglamentoCard extends StatelessWidget {
  final ReglamentoModel reglamento;

  const ReglamentoCard({
    Key key,
    this.reglamento,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTileDefault(
      text: reglamento.nombre,
      top: 5.0,
      bottom: 5.0,
      trailing: Icons.book,
      onPress: () async => await Get.dialog(
        PdfViewerDialog(
          path: "${GetStorages.inst.server}/${reglamento.ruta}",
          onTap: Get.back,
        ),
        barrierDismissible: false,
      ),
    );
  }
}
