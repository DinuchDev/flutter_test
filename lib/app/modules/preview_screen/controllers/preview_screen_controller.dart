import 'dart:io';
import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:convert';
import 'package:image_picker_for_web/image_picker_for_web.dart';

class PreviewScreenController extends GetxController {
  var excelData = <Map<String, dynamic>>[].obs;
  RxList<Uint8List> images = <Uint8List>[].obs;
  Rx<Uint8List?> imageBytes = Rx<Uint8List?>(null);
  RxMap<int, Uint8List> rowImages = <int, Uint8List>{}.obs;

  final count = 0.obs;
  RxString imageName = ''.obs;

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
          tempData.add(rowData);
        }
      }
    }
    excelData.clear();
    excelData.addAll(tempData);
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

  // Function to delete the image
  Future<void> deleteImage(rowId) async {
    imageBytes.value = null;
    // imageName.value = '';
  }
}
