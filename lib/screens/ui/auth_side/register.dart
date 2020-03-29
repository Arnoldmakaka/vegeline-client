import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vege_line/screens/ui/auth_side/login.dart';
import 'package:vege_line/screens/ui/home_side/home.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  // customer data
  String username = '';
  String contact = '';
  String password = '';

  // register method
  register(username, contact, password,context){

//    Navigator.push(
//      context,
//      MaterialPageRoute(builder: (context)=>Home()),
//     );
  }

  @override
  Widget build(BuildContext context) {

    // screen dimensions
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0x000000),
      body: ListView(
        children: <Widget>[
          Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              Image.asset(
                'assets/images/IMG-20200325-WA0011.jpg',
                height: screenHeight*0.2,
                fit: BoxFit.cover,
                width: screenWidth,
                color: Color.fromRGBO(255, 255, 255, 0.5),
                colorBlendMode: BlendMode.modulate,
              ),
              Container(
                padding: EdgeInsets.only(bottom:20.0,),
//                width: 110.0,
                child: Text(
                  'VegeLine',
                  style:TextStyle(
                    fontWeight: FontWeight.bold,
                      fontSize: 45,
                      color: Color(0xEBEBEBEB),
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(0, 3.0),
                          blurRadius: 3.0,
                          color: Color.fromRGBO(255, 255, 255, 0.6),
                        ),
                      ],
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: screenHeight*0.8,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                )
            ),
            padding: EdgeInsets.fromLTRB(15.0,5.0,15.0,5.0),
            child: Form(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20.0,),
                  Text(
                    'Sign up to get started',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[800],
                    ),
//                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 20.0,),
                  TextFormField(
                    onChanged: (value){
                      setState(() =>username = value);
                    },
                    decoration: InputDecoration(
                      hintText: 'Username / Email Address',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      contentPadding: EdgeInsets.all(12.0),
                    ),
                  ),
                  SizedBox(height: 15.0,),
                  TextFormField(
                    onChanged: (value){
                      setState(() =>contact = value);
                    },
                    decoration: InputDecoration(
                      hintText: 'Phone Contact',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      contentPadding: EdgeInsets.all(12.0),
                    ),
                  ),
                  SizedBox(height: 15.0,),
                  TextFormField(
                    onChanged: (value){
                      setState(() =>password=value);
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      contentPadding: EdgeInsets.all(12.0),
                    ),
                  ),
                  SizedBox(height: 15.0,),
                  TextFormField(
                    onChanged: (value){
                      if(password != value){

                      }
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Confirm Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      contentPadding: EdgeInsets.all(12.0),
                    ),
                  ),
                  SizedBox(height: 50.0,),
                  ButtonTheme(
                    minWidth: screenWidth*0.9,
                    height: 50.0,
                    child: RaisedButton(
                      onPressed: (){register(username, contact, password,
                          context);},
                      child: Text(
                        'Sign Up',
                        style: TextStyle(fontSize: 18.0,color: Colors.white),
                      ),
                      color: Colors.grey[800],
                      shape: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey[800],
                          width: 1.0,
                          style: BorderStyle.solid
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(40.0)),
                      ),
                    ),
                  ),
                  SizedBox(height: 8.0,),
                  FlatButton(
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder:(context)=>Login()),
                      );
                    },
                    child: RichText(
                      text: TextSpan(
                        text: 'Already have an account? Click ',
                        style: TextStyle(color: Colors.black,fontSize: 20,),
                        children: [
                          TextSpan(
                            text: 'here.',
                            style: TextStyle(color: Colors.deepOrange,
                              fontSize: 20,),
                          )
                        ]
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
