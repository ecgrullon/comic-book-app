import 'package:comicbook/app/models/issue.dart';
import 'package:comicbook/app/routes/app_pages.dart';
import 'package:comicbook/app/services/api_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final ApiService _apiService = Get.find<ApiService>();

  final RxList<Issue> issues = RxList<Issue>();
  final RxBool loading = true.obs;
  final RxBool listGrid = true.obs;

  @override
  void onReady() async {
    super.onReady();
    await _loadIssues();
  }

  _loadIssues() async {
    try {
      loading.value = true;
      var result = await _apiService.getIssues();
      issues.value = List.from(result);
      loading.value = false;
    } catch (e) {
      print(e);
    }
  }

  goToDetail(Issue issue) {
    Get.toNamed(Routes.DETAIL, arguments: issue);
  }

  changeListMode() {
    listGrid.value = !listGrid.value;
  }
}
