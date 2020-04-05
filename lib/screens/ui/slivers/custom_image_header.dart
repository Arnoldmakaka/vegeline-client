import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:vege_line/models/food_item.dart';

class CustomImageHeader implements SliverPersistentHeaderDelegate {

  CustomImageHeader({this.minExtent, this.maxExtent, this.food});
  final double maxExtent;
  final double minExtent;
  final FoodItem food;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Hero(
          tag: food.foodId, 
          child: Image.asset(
            food.imagePath,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 10.0,
          child:Container(
            width: MediaQuery.of(context).size.width,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(containerOpacity(shrinkOffset)),
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.black.withOpacity(containerOpacity(shrinkOffset)),
                    ),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                  ),
                ),
                Spacer(),
                Container(
                  margin: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(containerOpacity(shrinkOffset)),
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.favorite,
                      color: Colors.black.withOpacity(containerOpacity(shrinkOffset)),
                    ),
                    onPressed: (){
                      // Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        
      ],
    );
  }

  containerOpacity(double shrinkOffset){
    return 0.9 - max(0.0, shrinkOffset)/maxExtent;
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  @override
  FloatingHeaderSnapConfiguration get snapConfiguration => null;

  @override
  OverScrollHeaderStretchConfiguration get stretchConfiguration => null;

  
}