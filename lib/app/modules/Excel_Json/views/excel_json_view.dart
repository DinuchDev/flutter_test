import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/excel_json_controller.dart';

class ExcelJsonView extends GetView<ExcelJsonController> {
  const ExcelJsonView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Excel to JSON'),
      ),
      body: Center(
        child: Obx(() {
          if (controller.jsonData.isEmpty) {
            return ElevatedButton(
              onPressed: controller.pickExcelFile,
              child: Text('Pick Excel File'),
            );
          } else {
            return SingleChildScrollView(
              child: Text(jsonEncode(controller.jsonData.value)),
            );
          }
        }),
      ),
    );
  }
}
