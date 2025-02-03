import 'dart:convert';
import 'dart:typed_data';
import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:image/image.dart' as img;

class HomeController extends GetxController {
  var excelData = <Map<String, dynamic>>[].obs;

  Future<void> pickAndReadExcel() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['xlsx'],
    );

    if (result != null) {
      try {
        var bytes = result.files.first.bytes;
        if (bytes != null) {
          var excel = Excel.decodeBytes(bytes);
          if (excel.tables.isEmpty) {
            Get.snackbar("Error", "No sheets found in the Excel file.");
            return;
          }

          var sheet = excel.tables[excel.tables.keys.first];
          if (sheet == null || sheet.rows.isEmpty) {
            Get.snackbar("Error", "No data found in the sheet.");
            return;
          }

          var headers = sheet.rows.first
              .where((e) => e?.value != null && e!.value.toString().isNotEmpty) // Filter out null/empty values
              .map((e) => e?.value.toString().trim() ?? '')
              .toList();
          print("Headers: $headers");

          excelData.value = sheet.rows.skip(1).map((row) {
            var map = <String, dynamic>{};
            for (var i = 0; i < headers.length; i++) {
              if (headers[i].isNotEmpty) {
                map[headers[i]] = row[i]?.value ?? '';
              }
            }

            // Only process image if there's actual data in the 'រូបភាព' column
            if (map.containsKey('រូបភាព') && map['រូបភាព'] is String && map['រូបភាព'].toString().isNotEmpty) {
              String base64String = map['រូបភាព'].toString().trim();
              base64String = base64String.replaceAll(RegExp(r'\s+'), ''); // Remove spaces/newlines
              print("Processing Image Base64: $base64String");

              try {
                Uint8List imageBytes = base64Decode(base64String);
                print("Decoded Image Length: ${imageBytes.length}");

                // Resize the image (optional, if you want to limit the size)
                Uint8List resizedImage = resizeImage(imageBytes, 100, 100); // Example: resize to 100x100 pixels

                map['imageBytes'] = resizedImage;  // Store resized image
                map['imageType'] = 'base64';
              } catch (e) {
                print("Error decoding base64 image: $e");
              }
            }

            return map;
          }).toList();
        }
      } catch (e) {
        print("Error reading Excel file: $e");
        Get.snackbar("Error", "Failed to read Excel file.");
      }
    } else {
      Get.snackbar("Error", "No file selected.");
    }
  }

  // This function is used to resize the image
  Uint8List resizeImage(Uint8List imageBytes, int width, int height) {
    img.Image image = img.decodeImage(imageBytes)!;
    img.Image resized = img.copyResize(image, width: width, height: height);
    return Uint8List.fromList(img.encodeJpg(resized));  // Encoding back to Uint8List in JPEG format
  }
}