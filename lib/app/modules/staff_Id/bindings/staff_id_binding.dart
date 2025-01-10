import 'package:get/get.dart';

import '../controllers/staff_id_controller.dart';

class StaffIdBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StaffIdController>(
      () => StaffIdController(),
    );
  }
}
