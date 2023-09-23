import 'package:get/get.dart';
import '../modules/home/views/home_view.dart';
import '../modules/details/bindings/bindings.dart';
import '../modules/details/views/details_view.dart';
import '../modules/home/bindings/home_binding.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;
  static const DETAILS = Routes.DETAILS;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.DETAILS,
      page: () => DetailsView(),
      binding: DetailsBinding(),
    ),
  ];
}
