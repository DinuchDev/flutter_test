import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Excel Reader'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: controller.pickAndReadExcel,
            child: Text('Pick Excel File'),
          ),
          Expanded(
            child: Obx(() {
              if (controller.excelData.isEmpty) {
                return Center(child: Text('No data loaded'));
              } else {
                return ListView.builder(
                  itemCount: controller.excelData.length,
                  itemBuilder: (context, index) {
                    final map = controller.excelData[index];
                    final mapString = map.entries
                        .where((e) => e.key != 'decodedImage')
                        .map((e) => '${e.key}: ${e.value}')
                        .join(', ');
                    return ListTile(
                      title: Text(mapString),
                      subtitle: map['decodedImage'] != null
                          ? Image.memory(map['decodedImage'])
                          : Text('No image available'),
                    );
                  },
                );
              }
            }),
          ),
        ],
      ),
    );
  }
}
