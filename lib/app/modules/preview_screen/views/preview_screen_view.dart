import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:khmer_fonts/khmer_fonts.dart';
import '../controllers/preview_screen_controller.dart';
import 'dart:html' as html;
import 'dart:ui' as ui;
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'dart:typed_data';

class PreviewScreenView extends GetView<PreviewScreenController> {
  const PreviewScreenView({super.key});

// Function to capture an image without using isolates (Optimized for speed)
  Future<Uint8List> _captureImage(RenderRepaintBoundary boundary) async {
    final image = await boundary.toImage(
        pixelRatio: 1.0); // Reduce pixel ratio for faster capture
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    return byteData!.buffer.asUint8List();
  }

// Function to print multiple widgets (Optimized for speed)
  Future<void> printMultipleWidgets(BuildContext context) async {
    try {
      final pdf = pw.Document();

      // Collect all row keys
      final rowKeys = controller.excelData
          .map((row) => controller
              .rowKeys[row['id'] ?? row.hashCode]?.currentContext
              ?.findRenderObject() as RenderRepaintBoundary?)
          .where((boundary) => boundary != null)
          .toList();

      if (rowKeys.isEmpty) {
        Get.snackbar(
            'Warning!', 'Please Select Excel File before printing all.',
            snackPosition: SnackPosition.TOP);
        return;
      }

      // Capture all images in parallel (using Future.wait for async batch processing)
      final List<Future<Uint8List>> imageFutures =
          rowKeys.map((boundary) => _captureImage(boundary!)).toList();
      final List<Uint8List> images =
          await Future.wait(imageFutures); // Wait for all images to be captured

      // Add images to PDF
      for (var imageBytes in images) {
        final imageProvider = pw.MemoryImage(imageBytes);
        pdf.addPage(
          pw.Page(
            build: (pw.Context context) =>
                pw.Center(child: pw.Image(imageProvider)),
          ),
        );
      }

      // Save and print PDF
      final pdfBytes = await pdf.save();
      await Printing.layoutPdf(onLayout: (_) => pdfBytes);

      // Download PDF
      final blob = html.Blob([pdfBytes]);
      final url = html.Url.createObjectUrlFromBlob(blob);
      final anchor = html.AnchorElement(href: url)
        ..target = 'blank'
        ..download = 'print_all_images.pdf';
      anchor.click();
      html.Url.revokeObjectUrl(url);

      Get.snackbar(
        'Success',
        'Completed successfully! Please wait few minutes...',
        snackPosition: SnackPosition.TOP,
        duration: Duration(seconds: 3),
      );
    } catch (e) {
      print("Error during printing: $e");
      Get.snackbar(
        'Error',
        'Failed to print: ${e.toString()}',
        snackPosition: SnackPosition.TOP,
        duration: Duration(seconds: 3),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(0.1),
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.white.withOpacity(0.6))),
              onPressed: controller.pickAndReadExcelFile,
              child: const Text('Select Excel File'),
            ),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.white.withOpacity(0.6))),
              onPressed: () => controller.changeBackground(),
              child: Text('Choose Sample Cards'),
            ),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.white.withOpacity(0.6))),
              onPressed: () => printMultipleWidgets(context),
              child: Text('Print All'),
            ),
          ],
        ),
      ),
      body: RepaintBoundary(
        key: controller.globalKey,
        child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.all(48.0),
            child: Column(
              mainAxisSize: MainAxisSize.min, // Important to fit all content
              children: [
                Obx(() {
                  if (controller.excelData.isEmpty) {
                    return Center(
                      child: Text(
                        'No data Excel loaded',
                        style: TextStyle(fontSize: 18.0),
                        textAlign: TextAlign.center,
                      ),
                    );
                  }

                  List<List<Map<String, dynamic>>> chunkedData = [];
                  for (var i = 0; i < controller.excelData.length; i += 3) {
                    chunkedData.add(
                      controller.excelData.sublist(
                        i,
                        i + 3 > controller.excelData.length
                            ? controller.excelData.length
                            : i + 3,
                      ),
                    );
                  }

                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Column(
                      children: chunkedData.map((rowData) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 32.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: rowData.map((row) {
                              int rowId = row['id'] ??
                                  row.hashCode; // Use the same rowId logic
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: MouseRegion(
                                  onHover: (event) =>
                                      controller.setHoveredRowId(
                                          row['id'] ?? row.hashCode),
                                  onExit: (event) =>
                                      controller.setHoveredRowId(null),
                                  child: RepaintBoundary(
                                    key: controller.rowKeys[rowId],
                                    child: Stack(
                                      children: [
                                        Obx(() {
                                          return Image.asset(
                                            controller.backgroundImage.value,
                                            width: 400,
                                            height: 600,
                                            fit: BoxFit.contain,
                                          );
                                        }),
                                        Container(
                                          width: 400,
                                          height: 600,
                                          padding: const EdgeInsets.all(16),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const SizedBox(height: 81.5),
                                              GestureDetector(
                                                onTap: () => controller
                                                    .pickImageWeb(row['id'] ??
                                                        row.hashCode),
                                                child: Container(
                                                  width: 168,
                                                  height: 184.5,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16),
                                                  ),
                                                  child: Obx(() {
                                                    final imageBytes =
                                                        controller.rowImages[
                                                            row['id'] ??
                                                                row.hashCode];
                                                    return imageBytes != null
                                                        ? ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0),
                                                            child: Image.memory(
                                                              imageBytes,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          )
                                                        : Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              const Icon(
                                                                  Icons
                                                                      .add_photo_alternate_outlined,
                                                                  size: 60,
                                                                  color: Colors
                                                                      .grey),
                                                              Text(
                                                                  "Upload Image${controller.imageName.value.toString()}"),
                                                            ],
                                                          );
                                                  }),
                                                ),
                                              ),
                                              const SizedBox(height: 18.00),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    '${row['ឈ្មោះ'] ?? ''}',
                                                    style: TextStyle(
                                                        color: Colors
                                                            .blue.shade900,
                                                        fontFamily:
                                                            KhmerFonts.moul,
                                                        package: 'khmer_fonts',
                                                        fontSize: 28.00),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 5.0),
                                                    child: Text(
                                                      '${row['ឈ្មោះឡាតាំង'] ?? ''}',
                                                      style: const TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 22),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 10.0,
                                                            bottom: 18.0),
                                                    child: Text(
                                                      '${row['មុខងារ'] ?? ''}',
                                                      style: TextStyle(
                                                        color: Colors
                                                            .blue.shade900,
                                                        fontSize: 18,
                                                        fontFamily:
                                                            KhmerFonts.content,
                                                        package: 'khmer_fonts',
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 18.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 18.0,
                                                              right: 8.0),
                                                      child: Text(
                                                        'ID No                  : ${row['អត្តលេខ'] ?? ''}',
                                                        style: const TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 12),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 4.0),
                                                      child: Text(
                                                        'Starting Date     : ${controller.formatDate(row['ថ្ងៃចូលធ្វើការ'])}',
                                                        style: const TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 12),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 4.0),
                                                      child: Text(
                                                        'Expired Date      : ${controller.formatDate(row['ថ្ងៃផុតកំណត់'])}',
                                                        style: const TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 12),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Obx(() => controller
                                                    .hoveredRowId.value ==
                                                (row['id'] ?? row.hashCode)
                                            ? Positioned(
                                                top: 10,
                                                right: 10,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.white
                                                        .withOpacity(0.9),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors
                                                            .orange.shade900,
                                                        spreadRadius: 1,
                                                        blurRadius: 3,
                                                        offset:
                                                            const Offset(0, 2),
                                                      ),
                                                    ],
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      TextButton.icon(
                                                        onPressed: () {
                                                          // Call the printSpecificWidget function
                                                          controller
                                                              .printSpecificWidget(
                                                                  rowId);
                                                        },
                                                        icon: const Icon(
                                                            Icons.print,
                                                            size: 16),
                                                        label:
                                                            const Text('Print'),
                                                      ),
                                                      TextButton.icon(
                                                        onPressed: () {
                                                          // Call the deleted function
                                                          controller
                                                              .deleteRowImageById(
                                                                  rowId);
                                                        },
                                                        icon: const Icon(
                                                            Icons
                                                                .delete_forever_rounded,
                                                            size: 16),
                                                        label: const Text(
                                                            'Delete Image'),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              )
                                            : const SizedBox.shrink()),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        );
                      }).toList(),
                    ),
                  );
                }),
              ],
            )),
      ),
    );
  }
}
