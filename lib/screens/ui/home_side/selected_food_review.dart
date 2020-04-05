import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:vege_line/models/food_review.dart';

class SelectedFoodReview extends StatelessWidget {
  final Reviews foodreview;
  SelectedFoodReview({Key key, this.foodreview}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12.0,vertical: 8.0,),
      width: MediaQuery.of(context).size.width*0.9,
      child: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CircleAvatar(
                backgroundImage: AssetImage(foodreview.userImagePath),
                radius: 24.0,
              ),
              SizedBox(width:10.0,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(foodreview.userName,style: TextStyle(fontWeight: FontWeight.w800),),
                    Text(foodreview.reviewText, style: TextStyle(color: Colors.grey[600]),),
                    RatingBarIndicator(
                      rating: foodreview.rating,
                      itemBuilder: (context, index)=>Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      itemCount: 5,
                      itemSize: 20.0,
                    )
                  ],
                ),
              ),
              Text(foodreview.dateCreated),
            ],
          ),
          Divider(),
        ]
      ),
    );
  }
}