import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:vege_line/models/food_item.dart';
import 'package:vege_line/screens/ui/home_side/food_selection.dart';

class SelectedFoodItemWidget extends StatelessWidget {

  // final Category category;
  final FoodItem food;
  SelectedFoodItemWidget({Key key, this.food}):super(key:key);

  double ratingValue = 0.0;
  double totalRatingValue;

  calculateRating(reviews){
    for(int i=0;i<reviews.length;i++){
      totalRatingValue = (totalRatingValue+ reviews.rating);
    }
    return totalRatingValue/reviews.length;
  }

  // double finalRatingValue = calculateRating(food.reviews);

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context)=>FoodSelection(food:food),
          ), 
        );
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(12.0,2.0,12.0,12.0),
        height: 220,
        width: 220,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(9.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[350],
              offset: Offset(0.0, 1.0),
              blurRadius: 5.0,
            )
          ]
        ),
        child: Column(
          children: <Widget>[
            Hero(
              tag: food.foodId,
              child: Container(
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(9.0),topRight: Radius.circular(9.0)),
                  image: DecorationImage(
                    image: AssetImage(food.imagePath),
                    fit: BoxFit.cover,
                  )
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0,),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          food.foodName.length > 7 ? '${food.foodName.substring(0,6)}...' : food.foodName,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontFamily: 'OpenSans',
                            fontSize: 18.0,
                            fontWeight: FontWeight.w700
                          ),
                        ),
                        Text(
                          food.supplier.supplierName,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontFamily: 'OpenSans',
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey[500],
                          ),
                        ),
                        SizedBox(height:8.0),
                        RatingBarIndicator(
                          rating: 2.75,
                          itemBuilder: (context, index)=> Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          itemCount: 5,
                          itemSize: 18.0,
                          direction: Axis.horizontal,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex:1,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical:14.0,horizontal: 5.0,),
                    decoration: BoxDecoration(
                      color: Colors.red[500],
                      borderRadius: BorderRadius.all(Radius.circular(10.0))
                    ),
                    child: Text(
                      '${food.pricePerStandardMeasurementUnit}/=',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ), 
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
    
  }
}