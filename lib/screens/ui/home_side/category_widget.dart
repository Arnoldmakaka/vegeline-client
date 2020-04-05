import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vege_line/app_state.dart';
import 'package:vege_line/models/food_category.dart';

class CategoryWidget extends StatefulWidget {

  CategoryWidget({Key key,this.category}):super(key:key);
  final Category category;

  @override
  _CategoryWidgetState createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    final isSelected = appState.selectedCategoryId == widget.category.categoryId;

    print(isSelected);

    return InkWell(
      onTap: (){
        if(!isSelected){
          appState.updateCategoryId(widget.category.categoryId);
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal:8.0),
        margin: EdgeInsets.only(right:5.0,top:5.0),
        height: 90.0,
        width: 90.0,
        decoration: BoxDecoration(
          color: isSelected?Colors.grey[400]:Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          border: Border.all(color: isSelected?Colors.grey[400]:Colors.white,width: 3),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Icon(
                Icons.fastfood,
                color: isSelected?Colors.white:Colors.black,
              ),
            ),
            SizedBox(height: 10,),
            Expanded(
              child: Text(
                widget.category.categoryName.length > 10 ? '${widget.category.categoryName.substring(0,7)}...' : widget.category.categoryName,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 16.0,
                  color: isSelected?Colors.white:Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}