import 'package:appresort/app/views/regulation/controller/regulation_controller.dart';
import 'package:appresort/app/widgets/PdfViewer/pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegulationContent extends GetView<RegulationController> {
  static final String routeName = '/regulation-content';
  final String path;
  const RegulationContent({
    Key key,
    this.path,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: PdfViewer(
        path: path,
      ),
    );
  }
}
