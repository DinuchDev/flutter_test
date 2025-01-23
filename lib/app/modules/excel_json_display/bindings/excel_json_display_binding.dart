import 'package:get/get.dart';

import '../controllers/excel_json_display_controller.dart';

class ExcelJsonDisplayBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExcelJsonDisplayController>(
      () => ExcelJsonDisplayController(),
    );
  }
}
