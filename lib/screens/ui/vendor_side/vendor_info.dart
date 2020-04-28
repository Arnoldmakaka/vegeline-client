import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:vege_line/app_state.dart';
import 'package:vege_line/models/food_supplier.dart';
import 'package:vege_line/screens/ui/food_side/selected_food_widget.dart';
import 'package:vege_line/screens/ui/vendor_side/food_categories.dart';

class VendorInfoWidget extends StatelessWidget {
  VendorInfoWidget({this.vendor});
  final FoodSupplier vendor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ChangeNotifierProvider<AppState>(
        create: (context)=>AppState(),
          child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Colors.grey[300],
              pinned: true,
              floating: false,
              automaticallyImplyLeading: true,
              expandedHeight: MediaQuery.of(context).size.height*0.35,
              elevation: 0.0,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    Image.asset(vendor.profileImagePath, fit: BoxFit.cover,),
                    Positioned(
                      bottom: 15.0,
                      child: Container(
                        width: MediaQuery.of(context).size.width*0.95,
                        margin: EdgeInsets.fromLTRB(10.0,10.0,10.0,0.0),
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  vendor.supplierName,
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.blueGrey[700]
                                  ),
                                ),
                                Row(
                                  children: <Widget>[
                                    RatingBarIndicator(
                                      rating: vendor.rating,
                                      itemBuilder: (context,index)=>Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      itemCount: 5,
                                      itemSize: 16.0,
                                      direction: Axis.horizontal,
                                    ),
                                    SizedBox(width:8.0,),
                                    Text('${vendor.rating}', style: TextStyle(color: Colors.amber, fontWeight: FontWeight.w700,fontSize: 14.0,),)
                                  ],
                                ),
                                SizedBox(height:8.0,),
                                Divider(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Icon(Icons.call,color: Colors.blueGrey[300]),
                                        SizedBox(width:1.0,),
                                        Text(
                                          vendor.contact,
                                          style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.blueGrey[300]
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(width:5.0,),
                                    Row(
                                      children: <Widget>[
                                        Icon(Icons.location_on,color: Colors.blueGrey[300]),
                                        SizedBox(width:1.0,),
                                        Text(
                                          vendor.location.length > 10 ? '${vendor.location.substring(0, 9)}..' : vendor.location,
                                          style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.blueGrey[300]
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ]
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                <Widget>[
                  SizedBox(height:10.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14.0),
                    child: Text('ABOUT THE VENDOR', style: TextStyle(fontWeight: FontWeight.w600),),
                  ),
                  SizedBox(height:15.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14.0),
                    child: Text(vendor.description,style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'OpenSans'
                    ),),
                  ),
                  SizedBox(height:20.0),
                  Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(left:20.0),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            for(final category in vendor.foodCategories)
                            Consumer<AppState>(
                              builder:(context,appState,_) => FoodCategory(foodCategory: category, foodVendor: vendor,)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Consumer<AppState>(
                    builder: (context, appState, _) => Container(
                      margin: const EdgeInsets.only(top: 15.0,),
                      child: Container(
                        height: MediaQuery.of(context).size.height*0.3,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            for(final item in vendor.foodItems.where((e)=>e.category.categoryId.toString().contains(appState.selectedCategoryId.toString()))) 
                              SelectedFoodItemWidget(food: item,)
                          ],
                        ),
                      ),
                    ),
                  )
                ]
              ),
            )
          ],
        ),
      ),
    );
  }
}