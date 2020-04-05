import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomHeaderSliver implements SliverPersistentHeaderDelegate {
  CustomHeaderSliver({this.minExtent, this.maxExtent});

  final double minExtent;
  final double maxExtent;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[300],
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 0.05),
                blurRadius: 0.0,
              )
            ]
          ),
        ),
        Positioned(
          top: 16.0,
          left: screenWidth*0.34,
          child: Text(
            'VEGE-LINE',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
              fontFamily: 'OpenSans',
            ),
          ),
        ),
        Positioned(
          top: 6.0,
          right: 8.0,
          child: IconButton(
            icon: Icon(Icons.search),
            onPressed: (){},
          ),
        ),
        Positioned(
          bottom: 25.0,
          left: 12.0,
          child: Container(
            width: 180,
            child: Text(
              "Let's get shopping",
              style: GoogleFonts.lora(
                textStyle: TextStyle(
                  fontSize:30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black.withOpacity(changeOpacity(shrinkOffset)),
                )
              ),
            ),
          ),
        ),
      ],
    );
  }

  changeOpacity(double shrinkOffset){
    return 1.0 - max(0.0, shrinkOffset)/maxExtent;
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