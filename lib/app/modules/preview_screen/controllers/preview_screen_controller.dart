import 'dart:io';
import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:convert';
import 'package:image_picker_for_web/image_picker_for_web.dart';
import 'package:intl/intl.dart';
import 'dart:ui' as ui;
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'dart:html' as html;

class PreviewScreenController extends GetxController {
  var excelData = <Map<String, dynamic>>[].obs;
  var rowKeys = <int, GlobalKey>{}.obs; // Store GlobalKeys for each row
  RxList<Uint8List> images = <Uint8List>[].obs;
  Rx<Uint8List?> imageBytes = Rx<Uint8List?>(null);
  RxMap<int, Uint8List> rowImages = <int, Uint8List>{}.obs;
  final count = 0.obs;
  RxString imageName = ''.obs;
  final GlobalKey globalKey = GlobalKey();
  RxInt hoveredRowId = (-1).obs;

  // In PreviewScreenController
  var backgroundImage = 'assets/png/VetExpress-card-bgr.png'.obs;

// Function to change background image
  void changeBackground() {
    if (excelData.isEmpty) {
      Get.snackbar(
          'Warning!', 'Please Select Excel File before choosing sample cards.',
          snackPosition: SnackPosition.TOP);
      return;
    }

    backgroundImage.value =
        backgroundImage.value == 'assets/png/VetExpress-card-bgr.png'
            ? 'assets/png/BuvaSea-card-bgr.png'
            : 'assets/png/VetExpress-card-bgr.png';
  }

  // Define the setHoveredRowId method
  void setHoveredRowId(int? rowId) {
    hoveredRowId.value = rowId ?? -1;
    // print("Hovered Row ID set to: $rowId");
  }

  @override
  void onInit() {
    super.onInit();
    _initializeKeys();
  }

  void _initializeKeys() {
    rowKeys.clear(); // Reset the keys before populating
    for (var row in excelData) {
      int rowId = row['id'] ?? row.hashCode;
      rowKeys[rowId] = GlobalKey(); // Assign a unique GlobalKey for each row
    }
  }

  // Function to print a specific widget
  Future<void> printSpecificWidget(int rowId) async {
    try {
      hoveredRowId.value = -1;
      await Future.delayed(Duration(milliseconds: 100));

      final key = rowKeys[rowId];
      if (key == null) {
        // print("Key not found for row.");
        return;
      }
      final boundary =
          key.currentContext!.findRenderObject() as RenderRepaintBoundary?;
      if (boundary == null) {
        // print("Render boundary is null.");
        return;
      }

      final image = await boundary.toImage(pixelRatio: 2.0);
      final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      final buffer = byteData!.buffer.asUint8List();

      final pdf = pw.Document();
      final imageProvider = pw.MemoryImage(buffer);

      pdf.addPage(pw.Page(
          build: (pw.Context context) =>
              pw.Center(child: pw.Image(imageProvider))));

      final pdfBytes = await pdf.save();
      await Printing.layoutPdf(onLayout: (_) => pdfBytes);

      final blob = html.Blob([pdfBytes]);
      final url = html.Url.createObjectUrlFromBlob(blob);
      final anchor = html.AnchorElement(href: url)
        ..target = 'blank'
        ..download = 'print_specific_row.pdf';
      anchor.click();
      html.Url.revokeObjectUrl(url);
      hoveredRowId.value = rowId;

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

  Future<void> pickAndReadExcelFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['xlsx'],
      );

      if (result != null) {
        if (kIsWeb) {
          var bytes = result.files.single.bytes;
          if (bytes != null) {
            var excel = Excel.decodeBytes(bytes);
            await _parseExcelData(excel);
          }
        } else {
          File file = File(result.files.single.path!);
          var bytes = file.readAsBytesSync();
          var excel = Excel.decodeBytes(bytes);
          await _parseExcelData(excel);
        }
        for (var row in excelData) {
          print("Row Data: $row");
        }
      } else {
        print("No file selected.");
      }
    } catch (e) {
      print("Error while picking or reading the file: $e");
    }
  }

  Future<void> _parseExcelData(Excel excel) async {
    List<Map<String, dynamic>> tempData = [];
    for (var table in excel.tables.keys) {
      var sheet = excel.tables[table];
      if (sheet != null) {
        var header = sheet.rows.first.map((cell) => cell?.value).toList();
        for (var i = 1; i < sheet.rows.length; i++) {
          var row = sheet.rows[i];
          var rowData = Map<String, dynamic>.fromIterables(
            header.map((e) => e.toString()),
            row.map((cell) {
              if (cell?.value != null && cell?.value is String) {
                String cellValue = cell!.value as String;
                int cellIndex = row.indexOf(cell);
                if (header[cellIndex].toString() == 'រូបភាព' ||
                    header[cellIndex].toString() == 'រូបថត') {
                  if (isBase64(cellValue)) {
                    try {
                      Uint8List imageData = base64Decode(cellValue);
                      images.add(imageData);
                      return imageData;
                    } catch (e) {
                      print("Error decoding image: $e");
                    }
                  }
                }
              }
              return cell?.value;
            }),
          );
          // Ensure each row has a unique 'id'
          rowData['id'] ??= rowData.hashCode;
          tempData.add(rowData);
        }
      }
    }
    excelData.clear();
    excelData.addAll(tempData);
    _initializeKeys(); // Call this after updating excelData
  }

  formatDate(dynamic date) {
    if (date == null) return '';
    try {
      final DateTime parsedDate = DateTime.parse(date.toString());
      return DateFormat('dd-MM-yyyy').format(parsedDate);
    } catch (e) {
      return date.toString();
    }
  }

  bool isBase64(String str) {
    if (str.isEmpty) return false;
    try {
      base64Decode(str);
      return true;
    } catch (e) {
      return false;
    }
  }

  // Function to pick an image
  Future<void> pickImageWeb(dynamic rowId) async {
    try {
      final ImagePickerPlugin picker = ImagePickerPlugin();
      final media = await picker.getImage(source: ImageSource.gallery);
      if (media != null) {
        final bytes = await media.readAsBytes();
        imageBytes.value = bytes;
        images.add(bytes);
        rowImages[rowId] = bytes; //image with specific row
        print("Image picked successfully");
      } else {
        print("No image selected.");
      }
    } catch (e) {
      print("Error while picking image: $e");
    }
  }

  // Function to delete rowImages by rowId (GlobalKey)
  Future<void> deleteRowImageById(int rowId) async {
    final key = rowKeys[rowId];
    if (key != null) {
      rowImages.remove(rowId);
      rowKeys[rowId] = GlobalKey();
      update(); // Trigger UI update
      // print("Image and GlobalKey for rowId $rowId deleted.");
    } else {
      print("RowId $rowId not found.");
    }
  }
}
