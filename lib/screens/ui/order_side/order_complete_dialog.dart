import 'package:flutter/material.dart';
import 'package:vege_line/screens/ui/food_side/food_category.dart';

class OrderCompleteDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height*0.5,
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 20.0,),
                Container(
                  padding: EdgeInsets.all(10.0),
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius:BorderRadius.circular(50.0),
                    border: Border.all(width: 3, color: Colors.green[600])
                  ),
                  child: Icon(
                    Icons.check,
                    size: 40.0,
                    color: Colors.green[600],
                  )
                ),
                SizedBox(height: 20.0,),
                Text('Your order was successfully made!', style: TextStyle(fontSize: 20.0,fontFamily: 'OpenSans',fontWeight: FontWeight.w600),textAlign: TextAlign.center,),
                SizedBox(height: 30.0,),
                ButtonTheme(
                  minWidth: MediaQuery.of(context).size.width*0.6,
                  height: 40.0,
                  child: RaisedButton(
                    onPressed: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>FoodCategory()));
                    },
                    child: Text(
                      'Continue Shopping',
                      style: TextStyle(
                        color: Colors.grey[300],
                        fontSize: 16.0,
                      ),
                    ),
                    color: Colors.grey[800],
                    shape: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      borderSide: BorderSide(
                        color: Colors.grey[800],
                        width: 1.0,
                        style: BorderStyle.solid,
                      )
                    ),
                  ),
                ),
                SizedBox(height: 15.0,),
                ButtonTheme(
                  minWidth: MediaQuery.of(context).size.width*0.6,
                  height: 40.0,
                  child: RaisedButton(
                    elevation: 0.0,
                    onPressed: (){
                      
                    },
                    child: Text(
                      'Contact supplier',
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 16.0,
                      ),
                    ),
                    color: Colors.white,
                    shape: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      borderSide: BorderSide(
                        color: Colors.grey[800],
                        width: 1.0,
                        style: BorderStyle.solid,
                      )
                    ),
                  ),
                ),
              ],
            ),
          ]
        ),
      ),
    );
  }
}