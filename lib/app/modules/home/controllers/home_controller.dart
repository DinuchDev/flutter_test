import 'dart:convert';
import 'dart:typed_data';
import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var excelData = <Map<String, dynamic>>[].obs;

  void pickAndReadExcel() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['xlsx'],
    );

    if (result != null) {
      var bytes = result.files.first.bytes;
      if (bytes != null) {
        var excel = Excel.decodeBytes(bytes);
        var sheet = excel.tables[excel.tables.keys.first];
        if (sheet != null) {
          var headers = sheet.rows.first.map((e) => e?.value.toString().trim())
              .toList();
          print('Headers: $headers'); // Debugging log
          excelData.value = sheet.rows.skip(1).map((row) {
            var map = <String, dynamic>{};
            for (var i = 0; i < headers.length; i++) {
              if (headers[i] != null) {
                map[headers[i]!] = row[i]?.value ?? '';
              }
            }
            // Validate and decode base64 image if present
            if (map.containsKey('រូបភាព') && map['រូបភាព'] is String) {
              String base64String = map['រូបភាព'].toString().trim();
              try {
                if (base64String.startsWith('http')) {
                  // Handle URL image
                  map['imageUrl'] = base64String;
                  map['imageType'] = 'url';
                } else {
                  // Handle base64 image
                  if (base64String.startsWith('data:image')) {
                    base64String = base64String
                        .split(',')
                        .last;
                  }
                  if (isValidBase64(base64String)) {
                    Uint8List imageBytes = base64Decode(base64String);
                    map['imageBytes'] = imageBytes;
                    map['imageType'] = 'base64';
                  }
                }
              } catch (e) {
                print('Error processing image: $e');
                map['imageType'] = 'error';
              }
            }
            return map;
          }).toList();
        }
      }
    }
  }

  bool isValidBase64(String base64String) {
    if (base64String.isEmpty) return false;
    try {
      base64Decode(base64String);
      return true;
    } catch (e) {
      return false;
    }
  }

  Uint8List? getImageBytes(Map<String, dynamic> data) {
    if (data['imageType'] == 'base64') {
      return data['imageBytes'] as Uint8List?;
    }
    return null;
  }

  String? getImageUrl(Map<String, dynamic> data) {
    if (data['imageType'] == 'url') {
      return data['imageUrl'] as String?;
    }
    return null;
  }
}
