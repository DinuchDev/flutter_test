import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Excel Reader'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: controller.pickAndReadExcel,
            child: const Text('Pick Excel File'),
          ),
          Expanded(
            child: Obx(() {
              if (controller.excelData.isEmpty) {
                return const Text("No data available");
              }

              return ListView.builder(
                itemCount: controller.excelData.length,
                itemBuilder: (context, index) {
                  var item = controller.excelData[index];

                  return Card(
                    child: Column(
                      children: [
                        Text("រូបភាព: ${item['រូបភាព']}"),
                        (item['imageBytes'] != null &&
                            (item['imageBytes'] as Uint8List).isNotEmpty)
                            ? Image.memory(item['imageBytes'], height: 100, width: 100)
                            : const Text("No Image Available"),
                      ],
                    ),
                  );
                },
              );
            }),
          ),



        ],
      ),
    );
  }
}
