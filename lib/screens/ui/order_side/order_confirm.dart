import 'package:flutter/material.dart';
import 'package:vege_line/screens/ui/order_side/order_complete_dialog.dart';

class ConfirmedOrder extends StatefulWidget {

  ConfirmedOrder({this.priceOfItem});
  final double priceOfItem;

  @override
  _ConfirmedOrderState createState() => _ConfirmedOrderState();
}

class _ConfirmedOrderState extends State<ConfirmedOrder> {
  List deliveryOptions = [
      'Pick Up',
      'Deliver'
    ];
    List paymentOptions = [
      'MTN Mobile Money',
      'Pay on PickUp'
    ];
    var _selectedOption;
    var _paymentOption;

    // mobile money activator
    useMobileMoney(){

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
        actions: <Widget>[
          IconButton(icon: Icon(Icons.clear), onPressed: ()=>{
            Navigator.pop(context)
          })
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal:12.0),
        child: ListView(
          children: <Widget>[
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
                      fontSize: 18.0,
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
                      print(option);
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
                      fontSize: 18.0,
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                // SizedBox(width:10,),
                Builder(
                  builder: (context) => DropdownButton(
                    value: _paymentOption,
                    items: paymentOptions.map((value){
                      return DropdownMenuItem(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(), 
                    onChanged: (value){
                      setState(() {
                        _paymentOption = value;
                      });

                      if(_selectedOption == 'Deliver' && _paymentOption == 'Pay on PickUp'){
                        Scaffold.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Payment can only be in-app for food delivery"),
                          )
                        );
                      }
                    },
                    hint: Text('Select here'),
                  ),
                ),
              ]
            ),
            Divider(),
            SizedBox(height: 20.0,),
            Row(
              children: <Widget>[
                Text(
                  'Total Food Item Cost',
                  style: TextStyle(
                    fontSize: 17.0,
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Spacer(),
                Text(
                  '${widget.priceOfItem}/=',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.w700,
                    color: Colors.green[700],
                  ),
                ),
              ],
            ),
            SizedBox(height: 60.0,),
            ButtonTheme(
              minWidth: MediaQuery.of(context).size.width*0.9,
              height: 50.0,
              child: RaisedButton(
                onPressed: (){
                  if(_selectedOption == 'MTN Mobile Money'){
                    useMobileMoney();
                    showDialog(
                      context: context,
                      builder: (context)=>OrderCompleteDialog(),
                    );
                  }else{
                    showDialog(
                      context: context,
                      builder: (context)=>OrderCompleteDialog(),
                    );
                  }
                },
                child: Text(
                  'Make Your Order',
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
      )
    );
  }
}