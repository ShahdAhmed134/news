import 'package:flutter/material.dart';
import 'package:news/model/SourceResponse.dart';
import 'package:news/model/api_manager.dart';

class ViewModelCategoryDetails extends ChangeNotifier {
  /// hold data - handle logic
  List<Source>? sourceList;
  String? errorMessage;

  void getSources(String category) async {
    sourceList = null;
    errorMessage = null;
    notifyListeners();
    try {
      var response = await ApiManager.getSource(category);
      if (response?.status == 'error') {
        errorMessage = response!.message;
      } else {
        sourceList = response!.sources;
      }
    } catch (e) {
      errorMessage = e.toString();
    }
    notifyListeners();
  }
}
