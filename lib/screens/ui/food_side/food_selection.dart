import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:vege_line/models/food_item.dart';
import 'package:vege_line/screens/ui/food_side/selected_food_review.dart';
import 'package:vege_line/screens/ui/order_side/order.dart';
import 'package:vege_line/screens/ui/slivers/custom_image_header.dart';

class FoodSelection extends StatelessWidget {

  FoodSelection({Key key, this.food}):super(key:key);
  final FoodItem food;
  final List keyWords = [
    'tender',
    'soft',
    'fresh from market',
    'bargainable'
  ];

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      // backgroundColor: Colors.white,
      body: SafeArea(
          child: CustomScrollView(
          slivers: <Widget>[
            SliverPersistentHeader(
              floating: true,
              pinned: false,
              delegate: CustomImageHeader(
                minExtent: screenHeight*0.1,
                maxExtent: screenHeight*0.3,
                food: food,
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(<Widget>[
                Stack(
                  children: <Widget>[
                    SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.fromLTRB(10.0,10.0,10.0,12.0),
                            padding: EdgeInsets.all(15.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(9.0)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(0.0, 2.0),
                                  blurRadius: 7.0,
                                )
                              ]
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      food.foodName,
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'OpenSans'
                                      ),
                                    ),
                                    Spacer(),
                                    Container(
                                      padding: EdgeInsets.all(2.0,),
                                      decoration: BoxDecoration(
                                        color: Colors.red[500],
                                        borderRadius: BorderRadius.all(Radius.circular(12.0))
                                      ),
                                      child: Text(
                                        '${food.pricePerStandardMeasurementUnit}/=',
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          fontFamily: 'OpenSans',
                                          fontWeight: FontWeight.w900,
                                          color: Colors.white,
                                        ), 
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    RatingBarIndicator(
                                      rating: 3.5,
                                      itemBuilder: (context,index)=>Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      itemCount: 5,
                                      itemSize: 18.0,
                                    ),
                                    SizedBox(width:10,),
                                    Text(
                                      '3.5', 
                                      style: TextStyle(
                                        color: Colors.amber,
                                        fontWeight: FontWeight.w500)
                                      ,
                                    ),
                                    SizedBox(width:10,),
                                    Text(
                                      '(${food.reviews.length} reviews)',
                                      style: TextStyle(
                                        color: Colors.grey[700]
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 3.0,),
                                RichText(
                                  text: TextSpan(
                                    text: 'Supplied by ',
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: food.supplier.supplierName,
                                        style: TextStyle(color: Colors.grey[900],fontWeight: FontWeight.w500,)
                                      )
                                    ],
                                    style: TextStyle(
                                      color: Colors.grey[700]
                                    ),
                                  ),
                                ),
                                SizedBox(height: 4.0,),
                                Container(
                                  height: 40.0,
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: <Widget>[
                                        for(final keyword in keyWords) 
                                          Container(
                                            padding: EdgeInsets.fromLTRB(2.0,0.0,2.0,8.0),
                                            height: 35.0,
                                            // margin: EdgeInsets.symmetric(horizontal: 3.0,),
                                            child: RichText(
                                              textAlign: TextAlign.center,
                                              text:TextSpan(
                                                text: keyword,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.grey[500],
                                                  fontSize: 15.0,
                                                ),
                                                children: <TextSpan>[
                                                  TextSpan(
                                                    text: ' .',
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 25.0,
                                                    )
                                                  )
                                                ]
                                              ),
                                            ),
                                          )
                                      ],
                                    ),
                                  ),
                                ),
                                Divider(),
                                SizedBox(height: 5.0,),
                                GestureDetector(
                                  onTap: (){
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context)=>OrderWidget(food:food),
                                      )
                                    );
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(
                                        Icons.shopping_cart,
                                        color: Colors.green[600],
                                      ),
                                      SizedBox(width:10.0,),
                                      Text(
                                        'Place your Order',
                                        style: TextStyle(
                                          fontSize: 17.0,
                                          color: Colors.green[600],
                                          fontWeight: FontWeight.w800,
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              'Reviews',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontFamily: 'OpenSans',
                                fontSize: 18.0,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical:10.0),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Column(
                                children: <Widget>[
                                  for(final review in food.reviews) SelectedFoodReview(foodreview: review,)
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                
              ]),
            ),
            
          ],
        ),
      ),
    );
  }
}