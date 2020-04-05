import 'package:flutter/foundation.dart';

class AppState extends ChangeNotifier{
  int selectedCategoryId = 0;

  updateCategoryId(int selectedCategoryId){
    this.selectedCategoryId = selectedCategoryId;
    notifyListeners();
  }
}