import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:vege_line/app_state.dart';
import 'package:vege_line/models/food_category.dart';
import 'package:vege_line/models/food_item.dart';
import 'package:vege_line/models/food_stuff.dart';
import 'package:vege_line/screens/ui/food_side/all_selected_food.dart';
import 'package:vege_line/screens/ui/home_side/category_widget.dart';
import 'package:vege_line/screens/ui/home_side/drawer_widget.dart';
import 'package:vege_line/screens/ui/food_side/selected_food_widget.dart';
import 'package:vege_line/screens/ui/home_side/settings.dart';
import 'package:vege_line/screens/ui/vendor_side/vendor_intro_widget.dart';

class FoodCategory extends StatefulWidget {

  FoodCategory({Key key, this.fcategory}):super(key:key);
  final Category fcategory;

  @override
  _FoodCategoryState createState() => _FoodCategoryState(fcategory);
}

class _FoodCategoryState extends State<FoodCategory> {
  _FoodCategoryState(this.fcategory);
  final Category fcategory;
  List<FoodItem>foodstuff = [];
  
  
  // assign data to these
  // List<Category> foodCategories = [];

  @override
  void initState() {
    super.initState();
    getFoodItems();
    // getCategories();
  }

  getFoodItems(){
    // assign them to foodItems also look at how the dummy data is organised in models/food_stuff.dart
    for(final item in foodItems){
      for(final object in item){
        foodstuff.add(object);
      }
    }
  }

  getCategories(){
    // assign them to foodCategories also again look at how the dummy data is organised in models/food_stuff.dart
  }

  

  @override
  Widget build(BuildContext context) {
    List<String> items = [
      'Settings',
      // 'My Transactions'
    ];
    return Scaffold(
      drawer: LeftDrawerWidget(),
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(<Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  PopupMenuButton(
                    icon: Icon(Icons.more_vert),
                    itemBuilder: (context){
                      return items.map((item){
                        return PopupMenuItem(
                          value: item,
                          child: Text(item),
                        );
                      }).toList();
                    },
                    onSelected: (item){
                      if(item == 'Settings'){
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context)=>Settings(),
                        ));
                      }
                    },
                  )
                ],
              ),
              SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Text(
                  'Explore',
                  style: GoogleFonts.lora(
                    textStyle: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                padding: EdgeInsets.fromLTRB(5.0, 10.0, 0.0, 12.0),
                child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: <Widget>[
                        for(final category in foodCategories)
                          Consumer<AppState>(
                            builder: (context,appState,_) => CategoryWidget(category: category)),
                      ],
                  ),
                ),
              ),
              SizedBox(height: 10.0),
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
                        fontWeight: FontWeight.w800
                      ),
                    ),
                    Spacer(),
                    Consumer<AppState>(
                      builder:(context, appState, _) => GestureDetector(
                        onTap: (){
                          List<FoodItem> specifItem = [];
                          for(final item in foodstuff){
                            if(item.category.categoryId.toString().contains(appState.selectedCategoryId.toString())){
                              specifItem.add(item);
                            }
                            
                          }
                          Navigator.push(
                            context, MaterialPageRoute(builder: (context)=>AllSelectedFood(foodstuff: specifItem)),
                          );
                        },
                        child: Text(
                          'View all',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Consumer<AppState>(
                builder: (context, appState, _) => Container(
                  margin: EdgeInsets.only(top: 10.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: <Widget>[
                        for(final food in foodItems)
                          for(final item in food.where((e) => e.category.categoryId.toString().contains(appState.selectedCategoryId.toString())))
                        SelectedFoodItemWidget(food:item),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  'Your Vendors',
                  style: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 18.0,
                    fontWeight: FontWeight.w800
                  ),
                ),
              ),
              Consumer<AppState>(
                builder:(context, appState , _) => VendorIntroWidget(),
              ), 
            ]),
          ),
        ],
        ),
      ),
    );
  }
}