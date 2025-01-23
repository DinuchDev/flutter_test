import 'dart:convert';
import 'dart:typed_data';
import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

class ExcelJsonController extends GetxController {
  var jsonData = {}.obs; // Reactive variable to hold the parsed JSON

  // Pick Excel File
  Future<void> pickExcelFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['xlsx'], // Accept only .xlsx files
        withData: true, // Ensure file bytes are available
      );

      if (result != null) {
        Uint8List? fileBytes = result.files.first.bytes; // Get file bytes
        if (fileBytes != null) {
          await convertExcelToJson(fileBytes); // Convert Excel to JSON
        } else {
          print("File bytes are null.");
        }
      } else {
        print("No file selected");
      }
    } catch (e) {
      print("Error picking Excel file: $e");
    }
  }

  // Convert Excel to JSON
  Future<void> convertExcelToJson(Uint8List fileBytes) async {
    try {
      print("Decoding Excel...");
      final excel = Excel.decodeBytes(fileBytes); // Decode the Excel file

      Map<String, dynamic> jsonResult = {};
      for (var sheetName in excel.tables.keys) {
        print("Processing sheet: $sheetName");
        var sheet = excel.tables[sheetName];
        if (sheet != null) {
          // Convert each row and cell to JSON-compatible values
          jsonResult[sheetName] = sheet.rows.map((row) {
            return row.map((cell) {
              return extractCellValue(cell); // Ensure JSON-serializable cell value
            }).toList();
          }).toList();
        }
      }

      jsonData.value = jsonResult;
      print("JSON data: ${jsonEncode(jsonData.value)}");
    } catch (e) {
      print("Error converting Excel to JSON: $e");
      jsonData.value = {}; // Fallback to empty JSON
    }
  }

  // Helper method to extract cell values and ensure JSON-serializable output
  dynamic extractCellValue(Data? cell) {
    if (cell == null) return null; // Handle null cells
    final dynamic value = cell.value;

    // Handle TextCellValue, NumericCellValue, etc., by converting to their raw types
    if (value is String || value is num || value == null) {
      return value; // Already JSON-compatible types
    } else {
      return value.toString(); // Fallback: convert to string representation
    }
  }
}
