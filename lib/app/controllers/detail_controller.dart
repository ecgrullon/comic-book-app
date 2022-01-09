import 'package:comicbook/app/models/credit.dart';
import 'package:comicbook/app/models/credit_detail.dart';
import 'package:comicbook/app/models/issue.dart';
import 'package:comicbook/app/models/issue_detail.dart';
import 'package:comicbook/app/services/api_service.dart';
import 'package:get/get.dart';

class DetailController extends GetxController {
  final ApiService _apiService = Get.find<ApiService>();

  final Rx<Issue> issue = Issue().obs;
  final Rx<IssueDetail> issueDetail = IssueDetail().obs;
  final RxBool loading = true.obs;
  final RxList<CreditDetail> characters = RxList<CreditDetail>();
  final RxList<CreditDetail> teams = RxList<CreditDetail>();
  final RxList<CreditDetail> locations = RxList<CreditDetail>();
  final RxList<CreditDetail> concepts = RxList<CreditDetail>();

  @override
  void onInit() async {
    super.onInit();
    issue.value = Get.arguments as Issue;
  }

  @override
  void onReady() async {
    super.onReady();
    await _loadIssueDetail();
  }

  _loadIssueDetail() async {
    try {
      loading.value = true;
      issueDetail.value =
          await _apiService.getIssueDetail(issue.value.apiDetailUrl!);

      if (issueDetail.value.characterCredits!.isNotEmpty) {
        for (var item in issueDetail.value.characterCredits!) {
          var data = await _apiService.getCreditDetail(item.apiDetailUrl!);
          characters.add(data);
        }
      }

      if (issueDetail.value.teamCredits!.isNotEmpty) {
        for (var item in issueDetail.value.teamCredits!) {
          var data = await _apiService.getCreditDetail(item.apiDetailUrl!);
          teams.add(data);
        }
      }

      if (issueDetail.value.locationCredits!.isNotEmpty) {
        for (var item in issueDetail.value.locationCredits!) {
          var data = await _apiService.getCreditDetail(item.apiDetailUrl!);
          locations.add(data);
        }
      }

      if (issueDetail.value.conceptCredits!.isNotEmpty) {
        for (var item in issueDetail.value.conceptCredits!) {
          var data = await _apiService.getCreditDetail(item.apiDetailUrl!);
          concepts.add(data);
        }
      }

      loading.value = false;
    } catch (e) {
      print(e);
    }
  }
}
