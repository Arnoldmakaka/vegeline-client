import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vege_line/app_state.dart';
import 'package:vege_line/models/food_stuff.dart';
import 'package:vege_line/screens/ui/home_side/vendor_widget.dart';

class VendorIntroWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final appStatus = Provider.of<AppState>(context);
    final icategoryId = appStatus.selectedCategoryId;


    for(final vendor in vendors){
      for(final category in vendor.foodCategories){
        if(category.categoryId == icategoryId){
          print('I exist!');
        }
      }
    }

    // print('I work');
    print('$icategoryId in appstate');

    return Padding(
      padding: EdgeInsets.fromLTRB(12.0, 3.0, 12.0, 5.0),
      child: Column(
        children: <Widget>[
          for(final vendor in vendors)
            if(vendor.foodCategories.map((f)=>f.categoryId.toString().contains(icategoryId.toString())) != null)
              VendorWidget(vendor:vendor)
            
        ],
      ),
    );
  }
}