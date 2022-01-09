import 'package:comicbook/app/models/credit_detail.dart';
import 'package:comicbook/app/models/issue.dart';
import 'package:comicbook/app/models/issue_detail.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiService extends GetxService {

  String _baseUrl = '';
  String _apiKey = '';
  
  ApiService()  {
    _baseUrl = dotenv.env['API_BASE_URL']!;
    _apiKey = dotenv.env['API_KEY']!;
  }
  
  Future<List<Issue>> getIssues() async {
    try {
      final result = await Dio().get("$_baseUrl/issues/?api_key=$_apiKey&sort=cover_date:desc&limit=20&format=json");
      var list = result.data['results'].map((data) => Issue.fromJson(data)).toList();
      return List<Issue>.from(list);
    } catch (err) {
      print(err);
      throw (err);
    }
  }

  Future<IssueDetail> getIssueDetail(String apiDetailUrl) async {
    try {
      final result = await Dio().get("$apiDetailUrl?api_key=$_apiKey&format=json");
      return IssueDetail.fromJson(result.data['results']);
    } catch (err) {
      print(err);
      throw (err);
    }
  }

  Future<CreditDetail> getCreditDetail(String apiDetailUrl) async {
    try {
      final result = await Dio().get("$apiDetailUrl?api_key=$_apiKey&format=json");
      return CreditDetail.fromJson(result.data['results']);
    } catch (err) {
      print(err);
      throw (err);
    }
  }
}
