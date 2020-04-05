import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:vege_line/models/food_supplier.dart';

class VendorWidget extends StatelessWidget {

  final FoodSupplier vendor;
  VendorWidget({Key key, this.vendor}):super(key:key);

  @override
  Widget build(BuildContext context) {
    // print(vendor.supplierId);

    return Container(
      padding: EdgeInsets.all(10.0,),
      margin: EdgeInsets.symmetric(vertical:10.0,),
      height: 130,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[350],
            offset: Offset(0.0, 1.0),
            blurRadius: 5.0,
          )
        ]
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            height: 110,
            width: MediaQuery.of(context).size.width*0.3,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(1.0)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[300],
                  offset: Offset(0.0, 0.0),
                  blurRadius: 2.0,
                )
              ],
              image: DecorationImage(
                image: AssetImage(
                  vendor.profileImagePath,
                ),
                fit: BoxFit.cover,
              )
            ),
          ),
          SizedBox(width: 8.0,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:<Widget>[
                Text(
                  vendor.supplierName,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'OpenSans',
                    color: Colors.black, 
                  ),
                ),
                SizedBox(height:5.0,),
                Text(
                  vendor.description.length > 15 ? '${vendor.description.substring(0,40)}...' : vendor.description,
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'OpenSans',
                    color: Colors.grey[400] 
                  ),
                ),
                SizedBox(height:17.0,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    RatingBarIndicator(
                      rating: vendor.rating,
                      itemBuilder: (context,index)=>Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      itemCount: 5,
                      itemSize: 20.0,
                      direction: Axis.horizontal,
                    ),
                    SizedBox(width:8.0,),
                    Text('${vendor.rating}', style: TextStyle(color: Colors.amber, fontWeight: FontWeight.w500),)
                  ],
                )
              ]
            ),
          ), 
          Icon(
            Icons.favorite,
            size: 20.0,
          )  
        ],
      ),
    );
  }
}