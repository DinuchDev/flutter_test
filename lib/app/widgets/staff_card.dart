// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:image_network/image_network.dart';
// import '../modules/home/controllers/home_controller.dart';
//
// class StaffCard extends StatelessWidget {
//   StaffCard({super.key});
//
//   final controller = Get.find<HomeController>();
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Obx(() {
//         if (controller.excelData.isEmpty) {
//           return const Center(child: Text('No data Excel loaded'));
//         } else {
//           return ListView.builder(
//             itemCount: controller.excelData.length,
//             itemBuilder: (context, index) {
//               final row = controller.excelData[index];
//               final photoPath = row['រូបថត']?.toString() ?? '';
//               return Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: Colors.orange.shade900,
//                     borderRadius: BorderRadius.circular(10),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black26,
//                         blurRadius: 5,
//                         offset: Offset(0, 2),
//                       ),
//                     ],
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Column(
//                       children: [
//                         // Header Row
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: ImageNetwork(
//                                 image:
//                                 "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDM2SDL8XuD21iaYLeaqwPExlBu8sZRuysoA&s",
//                                 height: 30,
//                                 width: 30,
//                               ),
//                             ),
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   "ក្រុមហ៉ុនវីរះ ប៉ុនថាំ អេចប្រេស ខូអិលធីឌី",
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 18,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                                 Text(
//                                   "VIREAK BUNTHAM EXPRESS CO., LTD",
//                                   style: TextStyle(
//                                     color: Colors.blue.shade900,
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.w400,
//                                   ),
//                                 ),
//                               ],
//                             )
//                           ],
//                         ),
//                         const SizedBox(height: 16),
//
//                         // Profile Picture and Details
//                         Container(
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           height: 140,
//                           width: 140,
//                           child: photoPath.isNotEmpty
//                               ? Image.network(
//                             photoPath,
//                             width: 50,
//                             height: 50,
//                             errorBuilder:
//                                 (context, error, stackTrace) =>
//                             const Icon(Icons.broken_image),
//                           )
//                               : const Icon(Icons.image_not_supported),
//                         ),
//                         const SizedBox(height: 16),
//                         Text(
//                           'Name: ${row['ឈ្មោះ'] ?? ''}',
//                           style: TextStyle(
//                             color: Colors.blue.shade900,
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         Text(
//                           'Latin Name: ${row['ឈ្មោះឡាតាំង'] ?? ''}',
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 18,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                         Text(
//                           'Role: ${row['មុខងារ'] ?? ''}',
//                           style: TextStyle(
//                             color: Colors.blue.shade900,
//                             fontSize: 16,
//                           ),
//                         ),
//                         const SizedBox(height: 8),
//                         Divider(color: Colors.white),
//                         const SizedBox(height: 8),
//
//                         // Additional Info
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               'ID No            : ${row['អត្តលេខ'] ?? ''}',
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 12,
//                               ),
//                             ),
//                             Text(
//                               'Start Date    : ${row['ថ្ងៃចូលធ្វើការ'] ?? ''}',
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 12,
//                               ),
//                             ),
//                             Text(
//                               'Expiry Date  : ${row['ថ្ងៃផុតកំណត់'] ?? ''}',
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 12,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               );
//             },
//           );
//         }
//       }),
//     );
//   }
// }
