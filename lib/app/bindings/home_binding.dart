import 'package:comicbook/app/controllers/home_controller.dart';
import 'package:comicbook/app/services/api_service.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApiService());
    Get.lazyPut(() => HomeController());
  }
}
