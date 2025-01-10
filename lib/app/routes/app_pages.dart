import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/staff_Id/bindings/staff_id_binding.dart';
import '../modules/staff_Id/views/staff_id_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.STAFF_ID;

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
  ];
}
