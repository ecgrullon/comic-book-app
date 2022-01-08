import 'package:comicbook/app/models/issue.dart';
import 'package:comicbook/app/services/api_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {

  final ApiService _apiService = Get.find<ApiService>();
  
  final RxList<Issue> issues = RxList<Issue>();

  @override
  void onReady() async {
    super.onReady();
    await _loadIssues();
  }

  _loadIssues() async {
    try {
      var result = await _apiService.getIssues();
      issues.value = List.from(result);
      print('sadsadsadasds');
      print(issues.value);
    } catch (e) {
      print(e);
    }
  }
}
