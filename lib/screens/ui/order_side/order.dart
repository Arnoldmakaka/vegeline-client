import 'package:flutter/material.dart';
import 'package:vege_line/models/food_item.dart';
import 'package:vege_line/screens/ui/order_side/order_complete_dialog.dart';

class OrderWidget extends StatefulWidget {
  OrderWidget({Key key, this.food}):super(key:key);
  final FoodItem food;

  @override
  _OrderWidgetState createState() => _OrderWidgetState(food);
}

class _OrderWidgetState extends State<OrderWidget> {
  _OrderWidgetState(this.food);
  FoodItem food;
  int numberOfItems;
  int priceOfItem;
  List deliveryOptions = [
    'Pick Up',
    'Deliver'
  ];
  List paymentOptions = [
    'MTN Mobile Money',
    'Pay on Delivery'
  ];
  var _selectedOption;
  var _paymentOption;

  setPriceOfItems(value){
    setState(() {
      priceOfItem = food.pricePerStandardMeasurementUnit * value;
    });
  }

  // mobile money activator
  useMobileMoney(){

  }

  @override
  void initState() {
    super.initState();
    numberOfItems = 1;
    priceOfItem = food.pricePerStandardMeasurementUnit;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Order',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.w600
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[300],
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal:12.0),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            SizedBox(height:12.0,),
            Row(
              children: <Widget>[
                Text(
                  'Food Item',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Spacer(),
                Text(food.foodName),
              ],
            ),
            Divider(thickness: 0.4,),
            Builder(
              builder: (context) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Quantity',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.add), 
                    onPressed: (){
                      
                      setState(() {
                        numberOfItems += 1;
                      });
                      setPriceOfItems(numberOfItems);

                      if(numberOfItems > food.numOfItems){
                        Scaffold.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Only ${food.numOfItems} items available'),
                          )
                        );
                        setState(() {
                          numberOfItems = 1;
                          priceOfItem = food.pricePerStandardMeasurementUnit;
                        });
                      }
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.remove), 
                    onPressed: ()=>{
                      
                      if(numberOfItems >1){
                        setState(() {
                          numberOfItems -= 1;
                        }), 
                        setPriceOfItems(numberOfItems),
                      }
                      
                    }
                  ),
                  Text(numberOfItems<=food.numOfItems ? '$numberOfItems' : '${numberOfItems-1}'),
                ],
              ),
            ),
            Divider(),
            Row(
              children: <Widget>[
                Text(
                  'Item Price',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Spacer(),
                Text('${food.pricePerStandardMeasurementUnit}/='),
              ],
            ),
            SizedBox(height:16.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Supplier Details',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width:3.0),
                Expanded(
                  child: Divider(thickness: 1,),
                ),
              ],
            ),
            SizedBox(height:10.0,),
            Row(
              children: <Widget>[
                Text(
                  'Name',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Spacer(),
                Text(food.supplier.supplierName),
              ],
            ),
            Divider(),
            Row(
              children: <Widget>[
                Text(
                  'Contact',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Spacer(),
                Text(food.supplier.contact),
              ],
            ),
            SizedBox(height:16.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Others',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width:3.0),
                Expanded(
                  child: Divider(thickness: 1,),
                ),
              ],
            ),
            SizedBox(height:10.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Text(
                    'Delivery Option',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                // SizedBox(width:10,),
                Builder(
                  builder: (context) => DropdownButton(
                    value: _selectedOption,
                    items: deliveryOptions.map((option){
                      return DropdownMenuItem(
                        value: option,
                        child: Text(option),
                      );
                    }).toList(), 
                    onChanged: (option){
                      setState(() {
                        _selectedOption = option;
                      });
                      if(_selectedOption == 'Deliver'){
                        Scaffold.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Delivery charges should be discussed with supplier"),
                          )
                        );
                      }
                    },
                    hint: Text('Select here'),
                  ),
                ),
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Text(
                    'Payment Method',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                // SizedBox(width:10,),
                Builder(
                  builder: (context) => DropdownButton(
                    value: _paymentOption,
                    items: paymentOptions.map((option){
                      return DropdownMenuItem(
                        value: option,
                        child: Text(option),
                      );
                    }).toList(), 
                    onChanged: (option){
                      setState(() {
                        _paymentOption = option;
                      });
                      if(_selectedOption == 'MTN Mobile Money'){
                        useMobileMoney();
                      }
                    },
                    hint: Text('Select here'),
                  ),
                ),
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Total Item Cost',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(width: 20.0,),
                Text(
                  '$priceOfItem/=',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.w700,
                    color: Colors.green[700],
                  ),
                ),
              ],
            ),
            SizedBox(height: 30.0,),
            ButtonTheme(
              minWidth: MediaQuery.of(context).size.width*0.9,
              height: 50.0,
              child: RaisedButton(
                onPressed: (){
                  showDialog(
                    context: context,
                    builder: (context)=>OrderCompleteDialog(),
                  );
                },
                child: Text(
                  'Place Your Order',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 18.0,
                  ),
                ),
                color: Colors.grey[300],
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(40.0)),
                  borderSide: BorderSide(
                    color: Colors.grey[300],
                    width: 1.0,
                    style: BorderStyle.solid,
                  )
                ),
              ),
            ),
            SizedBox(height: 30.0,),
          ],
        ),
      ),
    );
  }
}