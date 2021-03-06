import 'package:appresort/app/themes/app_theme.dart';
import 'package:appresort/app/widgets/PdfViewer/pdf_viewer_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Informacion {
  static final logo = Align(
    alignment: Alignment.topLeft,
    child: Image.asset(
      "assets/images/resort_logo.png",
      width: 100.0,
      height: 60.0,
      fit: BoxFit.cover,
    ),
  );

  static final footer = Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Text(
        "Powered by",
        style: TextStyle(color: Colors.grey),
      ),
      Image.asset(
        "assets/images/apleeks_logo.png",
        width: 90.0,
        height: 90.0,
      )
    ],
  );

  static final terminos = Container(
    margin: EdgeInsets.only(top: 20.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        GestureDetector(
          onTap: () => Get.dialog(
            PdfViewerDialog(
              path: "assets/documents/terminos-condiciones.pdf",
              isAsset: true,
            ),
            barrierDismissible: false,
          ),
          child: Text(
            "Términos y Condiciones",
            style: TextStyle(
              color: AppTheme.kTextColor,
              decoration: TextDecoration.underline,
            ),
          ),
        )
      ],
    ),
  );

  static final banner = Container(
    margin: EdgeInsets.only(top: 0.0),
    child: Container(
      height: Get.height * 0.32,
      width: Get.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/resort_banner.png"),
          fit: BoxFit.cover,
        ),
      ),
    ),
    width: double.infinity,
  );
}
