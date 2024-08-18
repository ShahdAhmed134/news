import 'package:flutter/material.dart';
import 'package:news/model/NewsResponse.dart';
import 'package:news/model/api_manager.dart';

class ViewModelNews extends ChangeNotifier {
  // hold data- handle logic
  List<New>? newList;
  String? errorMessage;

  void getNews(String sourceId) async {
    try {
      var response = await ApiManager.getNews(sourceId);
      if (response?.status == 'error') {
        errorMessage = response!.message;
      } else {
        newList = response!.articles;
      }
    } catch (e) {
      errorMessage = e.toString();
    }
    notifyListeners();
  }
}
