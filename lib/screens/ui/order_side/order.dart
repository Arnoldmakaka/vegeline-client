import 'package:flutter/material.dart';
import 'package:vege_line/models/food_item.dart';
import 'package:vege_line/screens/ui/order_side/order_confirm.dart';

class OrderWidget extends StatefulWidget {
  OrderWidget({Key key, this.food}):super(key:key);
  final FoodItem food;

  @override
  _OrderWidgetState createState() => _OrderWidgetState(food);
}

class _OrderWidgetState extends State<OrderWidget> {
  _OrderWidgetState(this.food);
  FoodItem food;
  double numberOfItems;
  double priceOfItem;

  setPriceOfItems(value){
    setState(() {
      priceOfItem = food.pricePerStandardMeasurementUnit * value;
    });
  }

  @override
  void initState() {
    super.initState();
    numberOfItems = 1;
    priceOfItem = food.pricePerStandardMeasurementUnit;
  }

  _confirmWithVendor(foodName, numberOfItems, foodPrice){
    
    // return booleanValue; to determine whether vendor has confirmed or not
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(horizontal:12.0, vertical: 5.0),
            color: Colors.grey[300],
            child: Row(
              children: <Widget>[
                Text(
                  'My Order',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.w600,
                    fontSize: 20.0
                  ),
                ),
                Spacer(),
                IconButton(icon: Icon(Icons.clear), onPressed: ()=>{
                  Navigator.pop(context)
                })
              ],
            ),
          ),
          SizedBox(height:12.0,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Item Details',
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
          ),
          SizedBox(height:10.0,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:12.0),
            child: Row(
              children: <Widget>[
                Text(
                  'Food Item',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Spacer(),
                Text(food.foodName),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:12.0),
            child: Divider(thickness: 0.4,),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:12.0),
            child: Builder(
              builder: (context) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Quantity',
                    style: TextStyle(
                      fontSize: 18.0,
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
                  Text(numberOfItems<=food.numOfItems ? '$numberOfItems ${food.standardMeasurement}' : '${numberOfItems-1} ${food.standardMeasurement}'),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:12.0),
            child: Divider(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:12.0),
            child: Row(
              children: <Widget>[
                Text(
                  'Item Price',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Spacer(),
                Text('${food.pricePerStandardMeasurementUnit}/='),
              ],
            ),
          ),
          SizedBox(height:16.0,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:12.0),
            child: Row(
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
          ),
          SizedBox(height:10.0,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:12.0),
            child: Row(
              children: <Widget>[
                Text(
                  'Name',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Spacer(),
                Text(food.supplier.supplierName),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:12.0),
            child: Divider(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:12.0),
            child: Row(
              children: <Widget>[
                Text(
                  'Contact',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Spacer(),
                Text(food.supplier.contact),
              ],
            ),
          ),
          SizedBox(height: 30.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:12.0),
            child: Row(
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
          ),
          SizedBox(height:30.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:12.0),
            child: ButtonTheme(
              minWidth: MediaQuery.of(context).size.width*0.9,
              height: 50.0,
              child: RaisedButton(
                onPressed: (){
                  bool _confirmed = _confirmWithVendor(food.foodName, numberOfItems, food.pricePerStandardMeasurementUnit);
                  // if(_selectedOption == 'MTN Mobile Money'){
                  //   useMobileMoney();
                    
                  //   showDialog(
                  //     context: context,
                  //     builder: (context)=>OrderCompleteDialog(),
                  //   );
                  // }
                  if(_confirmed){
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context)=>ConfirmedOrder(priceOfItem: priceOfItem)
                    ));
                  }
                  
                },
                child: Text(
                  'Confirm with Vendor',
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
          ),
          SizedBox(height: 30.0,),
        ],
      ),
    );
  }
}