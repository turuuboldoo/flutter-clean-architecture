import 'package:app/config/routes/home_routes.dart';
import 'package:app/features/home/presentation/controller/home_binding.dart';
import 'package:app/features/home/presentation/view/home_page.dart';
import 'package:get/get.dart';

class HomePages {
  static var pages = [
    GetPage(
      name: HomeRoutes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
  ];
}
