import 'package:flutter/material.dart';
import 'package:vege_line/screens/ui/home_side/drawer_widget.dart';
import 'package:vege_line/screens/ui/food_side/food_list_widget.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  textOpacity(double shrinkOffset){

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: Colors.black,),
        title: Text(
          'VEGE-LINE',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontFamily: 'OpenSans',
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Color(0xFFFFFFFF),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: (){},
          ),
        ],
      ),
      drawer: LeftDrawerWidget(),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:10.0),
            child: Text(
              'Categories',
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'OpenSans',
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: FoodListWidget(),
          ),
          SizedBox(height:10.0,)
        ],
      ),
    );
  }
}