
import 'package:comicbook/app/bindings/home_binding.dart';
import 'package:comicbook/app/pages/home_page.dart';
import 'package:get/get.dart';
part './app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
      transition: Transition.native),
  ];
}
