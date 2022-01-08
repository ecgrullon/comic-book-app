import 'package:comicbook/app/models/issue.dart';
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
      print("$_baseUrl/issues/?api_key=$_apiKey&format=json");
      final result = await Dio().get("$_baseUrl/issues/?api_key=$_apiKey&format=json");
      var list = result.data['results'].map((data) => Issue.fromJson(data)).toList();
      return List<Issue>.from(list);
    } catch (err) {
      print(err);
      throw (err);
    }
  }
}
