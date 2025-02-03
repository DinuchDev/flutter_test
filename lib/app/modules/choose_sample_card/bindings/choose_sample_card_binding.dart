import 'package:get/get.dart';

import '../controllers/choose_sample_card_controller.dart';

class ChooseSampleCardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChooseSampleCardController>(
      () => ChooseSampleCardController(),
    );
  }
}
