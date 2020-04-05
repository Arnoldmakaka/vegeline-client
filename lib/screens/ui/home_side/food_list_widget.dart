import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vege_line/app_state.dart';
import 'package:vege_line/models/food_stuff.dart';
import 'package:vege_line/screens/ui/home_side/food_category.dart';

class FoodListWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return GridView.count(
      crossAxisCount: 2, 
      crossAxisSpacing: 7.0,
      scrollDirection: Axis.vertical,
      primary: false,
      children: List.generate(6, (index){

        final appState = Provider.of<AppState>(context);
        // int catID = appState.selectedCategoryId;

        return GestureDetector(
          onTap: (){
            appState.updateCategoryId(foodCategories[index].categoryId);
            // print(appState.selectedCategoryId);
            // catID = appState.selectedCategoryId;

            Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context)=>FoodCategory(fcategory: foodCategories[index]),
              )
            );
            // print('$catID in appstate');
            
          },
          child: InkWell(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal:10.0),
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Container(
                    height: screenHeight*0.2,
                    width: screenWidth*0.5,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          foodCategories[index].imagePath,
                        ),
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0.0,3.0),
                          blurRadius: 10.0,
                        ),
                      ],
                    ),
                  ),
                  // Container(
                  //   color: Color.fromRGBO(255, 255, 255, 0.19),
                  // ),
                  Text('${foodCategories[index].categoryName}',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'OpenSans',
                    color: Colors.white,
                  ),),
                ],
              ),
            ),
          ),
        );
      },),
    );
  }
}