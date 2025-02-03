import 'package:get/get.dart';

import '../modules/Excel_Json/bindings/excel_json_binding.dart';
import '../modules/Excel_Json/views/excel_json_view.dart';
import '../modules/choose_sample_card/bindings/choose_sample_card_binding.dart';
import '../modules/choose_sample_card/views/choose_sample_card_view.dart';
import '../modules/excel_json_display/bindings/excel_json_display_binding.dart';
import '../modules/excel_json_display/views/excel_json_display_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/preview_screen/bindings/preview_screen_binding.dart';
import '../modules/preview_screen/views/preview_screen_view.dart';
import '../modules/staff_Id/bindings/staff_id_binding.dart';
import '../modules/staff_Id/views/staff_id_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.PREVIEW_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.STAFF_ID,
      page: () => const StaffIdView(),
      binding: StaffIdBinding(),
    ),
    GetPage(
      name: _Paths.EXCEL_JSON,
      page: () => const ExcelJsonView(),
      binding: ExcelJsonBinding(),
    ),
    GetPage(
      name: _Paths.EXCEL_JSON_DISPLAY,
      page: () => const ExcelJsonDisplayView(),
      binding: ExcelJsonDisplayBinding(),
    ),
    GetPage(
      name: _Paths.PREVIEW_SCREEN,
      page: () => const PreviewScreenView(),
      binding: PreviewScreenBinding(),
    ),
    GetPage(
      name: _Paths.CHOOSE_SAMPLE_CARD,
      page: () => const ChooseSampleCardView(),
      binding: ChooseSampleCardBinding(),
    ),
  ];
}
