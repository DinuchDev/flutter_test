import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/excel_json_display_controller.dart';

class ExcelJsonDisplayView extends GetView<ExcelJsonDisplayController> {
  const ExcelJsonDisplayView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ExcelJsonDisplayView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ExcelJsonDisplayView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
