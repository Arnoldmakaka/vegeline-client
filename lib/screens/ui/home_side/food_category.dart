import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vege_line/app_state.dart';
import 'package:vege_line/models/food_category.dart';
import 'package:vege_line/models/food_stuff.dart';
import 'package:vege_line/screens/ui/home_side/category_widget.dart';
import 'package:vege_line/screens/ui/home_side/drawer_widget.dart';
import 'package:vege_line/screens/ui/home_side/selected_food_widget.dart';
import 'package:vege_line/screens/ui/home_side/vendor_intro_widget.dart';
import 'package:vege_line/screens/ui/slivers/custom_header_sliver.dart';

class FoodCategory extends StatefulWidget {

  FoodCategory({Key key, this.fcategory}):super(key:key);
  final Category fcategory;

  @override
  _FoodCategoryState createState() => _FoodCategoryState(fcategory);
}

class _FoodCategoryState extends State<FoodCategory> {
  _FoodCategoryState(this.fcategory);
  final Category fcategory;
  
  // assign data to these
  // List<Category> foodCategories;
  // List<FoodItem> foodItems;

  @override
  void initState() {
    super.initState();

    // getFoodItems();
    // getCategories();
  }

  getFoodItems(){
    // assign them to foodItems also look at how the dummy data is organised in models/food_stuff.dart
  }

  getCategories(){
    // assign them to foodCategories also again look at how the dummy data is organised in models/food_stuff.dart
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    
    return Scaffold(
      drawer: LeftDrawerWidget(),
      backgroundColor: Colors.grey[100],
      body: ChangeNotifierProvider<AppState>(
        create: (context)=>AppState(),
          child: SafeArea(
            child: CustomScrollView(
            slivers: <Widget>[
              SliverPersistentHeader(
                pinned: false,
                floating: true,
                delegate: CustomHeaderSliver(
                  minExtent: screenHeight*0.09,
                  maxExtent: screenHeight*0.3,
                ),
              ),

              SliverList(
                delegate: SliverChildListDelegate(<Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(5.0, 10.0, 0.0, 12.0),
                    child: Consumer<AppState>(
                      builder: (context, appState, _) => SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: <Widget>[
                            for(final category in foodCategories) CategoryWidget(category: category)
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12.0,4.0,4.0,0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Popular',
                          style: TextStyle(
                            fontFamily: 'OpenSans',
                            fontSize: 18.0,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Spacer(),
                        Text(
                          'View all',
                          style: TextStyle(
                            color: Colors.green[800],
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                  Consumer<AppState>(
                    builder: (context, appState, _) => Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0,),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: <Widget>[
                            for(final food in foodItems)
                              for(final item in food.where((e)=>e.category.categoryId.toString().contains(appState.selectedCategoryId.toString())))
                            SelectedFoodItemWidget(food:item),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      'Your Vendors',
                      style: TextStyle(
                        fontFamily: 'OpenSans',
                        fontSize: 18.0,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  Consumer<AppState>(
                    builder:(context, appState ,_) => VendorIntroWidget(),
                    // here I failed to link the current categoryId in the appstate to a vendor, it's like it is showing all vendors
                  ),
                ]),
              ),
            ],
        ),
          ),
      ),
    );
  }
}