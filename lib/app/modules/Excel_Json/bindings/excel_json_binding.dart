import 'package:get/get.dart';

import '../controllers/excel_json_controller.dart';

class ExcelJsonBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExcelJsonController>(
      () => ExcelJsonController(),
    );
  }
}
