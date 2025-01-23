import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khmer_fonts/khmer_fonts.dart';
import '../controllers/preview_screen_controller.dart';
import 'package:printing/printing.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class PreviewScreenView extends GetView<PreviewScreenController> {
  const PreviewScreenView({super.key});

  // Widget _buildImageWidget(Map<String, dynamic> row) {
  //   var imageBytes = row['រូបថត'];
  //   return GestureDetector(
  //     onTap: () => controller.pickImageWeb(row),
  //     child: Container(
  //       width: 100,
  //       height: 100,
  //       decoration: BoxDecoration(
  //         shape: BoxShape.circle,
  //         border: Border.all(color: Colors.grey),
  //         image: imageBytes != null
  //             ? DecorationImage(
  //           image: MemoryImage(base64Decode(imageBytes)),
  //           fit: BoxFit.cover,
  //         )
  //             : null,
  //       ),
  //       child: imageBytes == null
  //           ? const Icon(Icons.person, size: 50, color: Colors.grey)
  //           : null,
  //     ),
  //   );
  // }

  formatDate(dynamic date) {
    if (date == null) return '';
    try {
      final DateTime parsedDate = DateTime.parse(date.toString());
      return DateFormat('dd-MM-yyyy').format(parsedDate);
    } catch (e) {
      return date.toString();
    }
  }

  Future<Uint8List> _generatePdf(PdfPageFormat format) async {
    final pdf = pw.Document();
    for (var row in controller.excelData) {
      pdf.addPage(
        pw.Page(
          build: (context) {
            return pw.SizedBox();
          },
        ),
      );
    }
    return pdf.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: controller.pickAndReadExcelFile,
              child: const Text('Select Excel File'),
            ),
            ElevatedButton(
              onPressed: () async {
                await Printing.layoutPdf(
                  onLayout: (PdfPageFormat format) => _generatePdf(format),
                );
              },
              child: const Text('Print ID Card'),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(64.0),
          child: Obx(() {
            if (controller.excelData.isEmpty) {
              return const Center(child: Text('No data Excel loaded'));
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

            return Column(
              children: chunkedData.map((rowData) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 32.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: rowData.map((row) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Stack(
                          children: [
                            Image.asset(
                              'assets/png/vet-card.png',
                              width: 400,
                              height: 600,
                              fit: BoxFit.contain,
                            ),
                            Container(
                              width: 400,
                              height: 600,
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(height: 81.5),
                                  // _buildImageWidget(row),
                                  GestureDetector(
                                    onTap: () => controller.pickImageWeb(
                                        row['id'] ?? row.hashCode),
                                    child: Container(
                                        width: 168,
                                        height: 184.5,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(16),
                                        ),
                                        child: Obx(() {
                                          final imageBytes =
                                          controller.rowImages[
                                          row['id'] ?? row.hashCode];
                                          return imageBytes != null
                                              ? ClipRRect(
                                            borderRadius:
                                            BorderRadius.circular(
                                                16.0),
                                            child: Image.memory(
                                              imageBytes,
                                              // Fetch the specific image for this row
                                              fit: BoxFit.cover,
                                            ),
                                          )
                                              : Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: [
                                              const Icon(
                                                  Icons
                                                      .add_photo_alternate_outlined,
                                                  size: 60,
                                                  color: Colors.grey),
                                              Text(
                                                  "Upload Image${controller.imageName.value.toString()}"),
                                            ],
                                          );
                                        })),
                                  ),
                                  const SizedBox(height: 18.00),
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${row['ឈ្មោះ'] ?? ''}',
                                        style: TextStyle(
                                            color: Colors.blue.shade900,
                                            fontFamily: KhmerFonts.moul,
                                            package: 'khmer_fonts',
                                            fontSize: 28.00),
                                      ),
                                      Padding(
                                        padding:
                                        const EdgeInsets.only(top: 5.0),
                                        child: Text(
                                          '${row['ឈ្មោះឡាតាំង'] ?? ''}',
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 22),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10.0, bottom: 18.0),
                                        child: Text(
                                          '${row['មុខងារ'] ?? ''}',
                                          style: TextStyle(
                                            color: Colors.blue.shade900,
                                            fontSize: 18,
                                            fontFamily: KhmerFonts.content,
                                            package: 'khmer_fonts',
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 18.0),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 18.0, right: 8.0),
                                          child: Text(
                                            'ID No                  : ${row['អត្តលេខ'] ?? ''}',
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 12),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          const EdgeInsets.only(top: 4.0),
                                          child: Text(
                                            'Starting Date     : ${formatDate(row['ថ្ងៃចូលធ្វើការ'])}',
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 12),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          const EdgeInsets.only(top: 4.0),
                                          child: Text(
                                            'Expired Date      : ${formatDate(row['ថ្ងៃផុតកំណត់'])}',
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
                            )
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                );
              }).toList(),
            );
          }),
        ),
      ),
    );
  }
}
