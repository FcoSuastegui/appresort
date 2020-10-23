import 'package:flutter/material.dart';
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';

class PdfViewerWidget extends StatefulWidget {
  final String path;
  PdfViewerWidget({ @required this.path });

  @override
  _PdfViewerWidgetState createState() => _PdfViewerWidgetState();
}

class _PdfViewerWidgetState extends State<PdfViewerWidget> {

  bool isLoading = true;
  PDFDocument document;

  @override
  void initState() { 
    super.initState();
    _init();
  }

  _init() async {
    document = await PDFDocument.fromURL(widget.path);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading 
      ? Center( child: CircularProgressIndicator())
      : PDFViewer(document: document, showPicker: false, ); 
  }
}