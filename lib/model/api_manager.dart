import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/model/NewsResponse.dart';
import 'package:news/model/SourceResponse.dart';
import 'package:news/model/api_constant.dart';

class ApiManager {
//https://newsapi.org/v2/top-headlines/sources?apiKey=c81b5044792f49908da8073ac4046a19
  static Future<SourceResponse?> getSource(String category) async {
    Uri url = Uri.https(ApiConstant.baseUrl, ApiConstant.apiSource,
        {'apiKey': ApiConstant.apiKey, 'category': category});
    var response = await http.get(url);
    try {
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return SourceResponse.fromJson(json);

      ///SourceResponse.fromJson(jsonDecode(response.body))
    } catch (e) {
      throw e;
    }
  }

  static Future<NewsResponse?> getNews(String sourceId) async {
    Uri url = Uri.https(ApiConstant.baseUrl, ApiConstant.apiNews,
        {'apiKey': 'c81b5044792f49908da8073ac4046a19', 'sources': sourceId});
    var response = await http.get(url);
    try {
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return NewsResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }
}
