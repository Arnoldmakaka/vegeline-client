import 'package:flutter/material.dart';

class CategoryBackground extends StatelessWidget {

  final double screenHeight;
  CategoryBackground({Key key, @required this.screenHeight}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight*0.25,
      color: Colors.grey[300],
    );
  }
}