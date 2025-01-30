import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:printing/printing.dart';
import '../controllers/preview_screen_controller.dart';
import 'package:pdf/widgets.dart' as pw;
import 'dart:html' as html;
import 'dart:ui' as ui;

class PrintScreenView extends GetView<PreviewScreenController> {
  const PrintScreenView({super.key});

  Future<void> printSingleWidget(BuildContext context) async {
    try {
      final boundary = controller.globalKey.currentContext!.findRenderObject()
          as RenderRepaintBoundary?;
      if (boundary == null) {
        print("Render boundary is null.");
        return;
      }

      final size = boundary.size;
      final totalHeight = size.height;

      final pdf = pw.Document();
      final chunkHeight = 1000.0; // Define your chunk size here

      int numberOfChunks = (totalHeight / chunkHeight).ceil();
      for (int i = 0; i < numberOfChunks; i++) {
        final image = await boundary.toImage(pixelRatio: 1.0);
        final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
        final buffer = byteData!.buffer.asUint8List();
        final imageProvider = pw.MemoryImage(buffer);
        pdf.addPage(
            pw.Page(build: (pw.Context context) => pw.Image(imageProvider)));
      }

      final pdfBytes = await pdf.save();
      await Printing.layoutPdf(onLayout: (_) => pdfBytes);

      // Trigger the download
      final blob = html.Blob([pdfBytes]);
      final url = html.Url.createObjectUrlFromBlob(blob);
      final anchor = html.AnchorElement(href: url)
        ..target = 'blank'
        ..download = 'print_single_widget.pdf';
      anchor.click();
      html.Url.revokeObjectUrl(url); // Clean up URL resources
    } catch (e) {
      print("Error during printing: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final rowData = controller.excelData.isNotEmpty
        ? controller.excelData.first
        : {}; // Get data for one widget

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.withOpacity(0.3),
        title: ElevatedButton(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(Colors.orange.shade600)),
          onPressed: () => printSingleWidget(context),
          child: Text('Print'),
        ),
      ),
      body: Center(
        child: RepaintBoundary(
          key: controller.globalKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/png/vet-card.png', // Widget to be printed
                width: 400,
                height: 600,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
