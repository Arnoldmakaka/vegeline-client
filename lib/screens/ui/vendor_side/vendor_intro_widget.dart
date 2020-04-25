import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vege_line/app_state.dart';
import 'package:vege_line/models/food_stuff.dart';
import 'package:vege_line/screens/ui/vendor_side/vendor_widget.dart';

class VendorIntroWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Consumer<AppState>(
      builder: (context, appState, _) => Padding(
        padding: EdgeInsets.fromLTRB(7.0, 3.0, 7.0, 5.0),
        child: Column(
          children: <Widget>[
            for(final vendor in vendors)
              for(final category in vendor.foodCategories)
                if(category.categoryId == appState.selectedCategoryId)
                  VendorWidget(vendor:vendor)
          ],
        ),
      ),
    );
  }
}