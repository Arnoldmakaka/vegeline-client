import 'package:flutter/material.dart';

class EditLabel extends StatelessWidget {
  EditLabel({this.label});

  final String label;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            color: Colors.grey[300],
            padding: const EdgeInsets.symmetric(horizontal:12.0, vertical: 5.0),
            child: Row(
              children: <Widget>[
                Text(
                  'Edit $label',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.w500,
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
          SizedBox(height:40.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: Form(
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: '$label',
                      contentPadding: EdgeInsets.all(12.0),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  ButtonTheme(
                    height: 45.0,
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: FlatButton(
                      color: Colors.grey[300],
                      onPressed: (){},
                      child: Text(
                        'Submit',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}