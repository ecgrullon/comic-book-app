import 'package:comicbook/app/controllers/detail_controller.dart';
import 'package:comicbook/app/services/api_service.dart';
import 'package:get/get.dart';

class DetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApiService());
    Get.lazyPut(() => DetailController());
  }
}
