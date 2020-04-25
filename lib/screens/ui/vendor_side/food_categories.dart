import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vege_line/app_state.dart';
import 'package:vege_line/models/food_category.dart';
import 'package:vege_line/models/food_supplier.dart';

class FoodCategory extends StatelessWidget {
  FoodCategory({this.foodCategory, this.foodVendor});
  final Category foodCategory;
  final FoodSupplier foodVendor;

  @override
  Widget build(BuildContext context) {
    var appState = Provider.of<AppState>(context);
    var isSelected = appState.selectedCategoryId == foodCategory.categoryId;

    if(appState.selectedCategoryId == 0){
      appState.selectedCategoryId = foodVendor.foodCategories[0].categoryId;
      isSelected = true;
    }

    return GestureDetector(
      onTap: (){
        if(!isSelected){
          appState.updateCategoryId(foodCategory.categoryId);
        }
      },
      child: Container(
        padding: EdgeInsets.all(8.0),
        margin: EdgeInsets.symmetric(horizontal: 5.0),
        decoration: BoxDecoration(
          color: isSelected?Colors.grey[400]:Colors.white,
          borderRadius: isSelected?BorderRadius.all(Radius.circular(20.0)):BorderRadius.circular(10.0),
        ),
        child: Text(
          foodCategory.categoryName,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18.0,
            color: isSelected?Colors.grey[100]:Colors.black,
            fontWeight: isSelected?FontWeight.w700:FontWeight.w600,
          ),
        ),
      ),
    );
  }
}