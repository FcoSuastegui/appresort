import 'package:flutter/material.dart';
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';

class PdfViewerDialog extends StatefulWidget {
  final String path;
  final Function onTap;
  final bool isAsset;

  PdfViewerDialog({
    @required this.path,
    this.onTap,
    this.isAsset = false,
  });

  @override
  _PdfViewerDialogState createState() => _PdfViewerDialogState();
}

class _PdfViewerDialogState extends State<PdfViewerDialog> {
  bool isLoading = true;
  PDFDocument document;

  @override
  void initState() {
    super.initState();
    _init();
  }

  _init() async {
    document = widget.isAsset
        ? await PDFDocument.fromAsset(widget.path)
        : await PDFDocument.fromURL(widget.path);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(child: CircularProgressIndicator())
        : Stack(
            children: [
              Container(
                padding: EdgeInsets.all(20.0),
                child: PDFViewer(
                  document: document,
                  showPicker: false,
                ),
              ),
              Positioned(
                right: 5.0,
                top: -5.0,
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: widget.onTap,
                  child: Icon(
                    Icons.clear,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          );
  }
}
