import 'package:flutter/material.dart';
import 'package:vege_line/screens/ui/home_side/drawer_widget.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List foodCategories = [
    ['Meats', 'assets/images/IMG-20200325-WA0043.jpg'],
    ['Grains', 'assets/images/IMG-20200325-WA0017.jpg'],
    ['Fruits and Vegs', 'assets/images/IMG-20200325-WA0051.jpg'],
    ['Poultry', 'assets/images/IMG-20200325-WA0045.jpg'],
    ['Tubers','assets/images/IMG-20200325-WA0053.jpg'],
    ['Dairy', 'assets/images/IMG-20200325-WA0019.jpg']
  ];

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
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
            padding: const EdgeInsets.all(12.0),
            child: Text(
              'Categories',
              style: TextStyle(
                fontSize: 42.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'OpenSans'
              ),
            ),
          ),
          Container(
            height: screenHeight,
            width: screenWidth,
            child: _buildFoodListWidget(context),
          ),
        ],
      ),
    );
  }

  Widget _buildFoodListWidget(context){
    // screen dimensions

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return GridView.count(
      crossAxisCount: 2,
      children: List.generate(6, (index){
        return Padding(
          padding: const EdgeInsets.fromLTRB(10.0,10.0,10.0,5.0),
          child: InkWell(
            child: Container(
              child: Column(
                children: <Widget>[
                  Container(
                    height: screenHeight*0.2,
                    width: screenWidth*0.5,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(foodCategories[index][1]),
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
//                    child: Card(
//                      elevation: 7.0,
//                      shape: OutlineInputBorder(
//                        borderRadius: BorderRadius.circular(15.0),
//                      ),
//                      child: Image.asset(
//                        foodCategories[index][1],
//                        fit: BoxFit.cover,
//                      ),
//                    ),
                  ),
                  SizedBox(height: 8.0,),
                  Text('${foodCategories[index][0]}',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'OpenSans'
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