import 'package:flutter/material.dart';
import 'package:vege_line/models/food_item.dart';
import 'package:vege_line/screens/ui/order_side/order.dart';

class SelectedFoodItemWidget extends StatelessWidget {

  final FoodItem food;
  SelectedFoodItemWidget({Key key, this.food}):super(key:key);


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context)=>OrderWidget(food:food),
          ), 
        );
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(5.0,2.0,5.0,0.0),
        width: MediaQuery.of(context).size.width*0.5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height:2.0),
            Stack(
              children: <Widget>[
                Hero(
                  tag: food.foodId,
                  child: Container(
                    height: MediaQuery.of(context).size.height*0.2,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0,3.0),
                          blurRadius: 7.0
                        ),
                      ],
                      borderRadius: BorderRadius.circular(9.0),
                      image: DecorationImage(
                        image: AssetImage(food.imagePath),
                        fit: BoxFit.cover,
                      )
                    ),
                  ),
                ),
                Positioned(
                  top: 12.0,
                  right: 0.0,
                  child: Container(
                    height: 24.0,
                    decoration: BoxDecoration(
                      color: Colors.red
                    ),
                    child: Text(
                      '${food.pricePerStandardMeasurementUnit}/=',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.w800,
                        color: Colors.white
                      ), 
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(left:8.0,top: 3.0),
                child: Text(
                  food.foodName.length > 9 ? '${food.foodName.substring(0,7)}...' : food.foodName,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
    
  }
}