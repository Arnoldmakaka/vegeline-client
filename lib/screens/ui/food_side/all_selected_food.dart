import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vege_line/app_state.dart';
import 'package:vege_line/models/food_item.dart';
import 'package:vege_line/models/food_stuff.dart';
import 'package:vege_line/screens/ui/food_side/selected_food_widget.dart';

class AllSelectedFood extends StatelessWidget {
  
  List<FoodItem> foodstuff = [];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Food Category',style: TextStyle(fontWeight: FontWeight.w600,color: Colors.blueGrey[900]),),
        elevation: 0.0,
        backgroundColor: Colors.grey[300],
      ),
      body: Builder(
        builder: (context) {
          final appState = Provider.of<AppState>(context);
          for(final item in foodItems){
            for(final object in item){
              if(object.category.categoryId.toString().contains(appState.selectedCategoryId.toString())){
                foodstuff.add(object);
              }
            }
          }
          return GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 7.0,
            childAspectRatio: 0.9,
            children: List.generate(foodstuff.length, (index){
              return SelectedFoodItemWidget(food: foodstuff[index]);
            }),
            scrollDirection: Axis.vertical,
            primary: false,
          );
        },
      )
    );
  }

}