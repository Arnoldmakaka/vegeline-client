import 'package:flutter/material.dart';
import 'package:vege_line/screens/ui/auth_side/register.dart';
import 'package:vege_line/screens/ui/home_side/home.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  // customer data
  String username = '';
  String password = '';

  // login method
  login(password, username,context){
   Navigator.push(
     context,
     MaterialPageRoute(builder: (context)=>Home()),
    );
  }

  // reset password
  passwordReset(){

  }

  @override
  Widget build(BuildContext context) {

    // screen dimensions
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color.fromRGBO(255,255, 255, 0.2),
      body: ListView(
        children: <Widget>[
          Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              Image.asset(
                'assets/images/IMG-20200325-WA0012.jpg',
                height: screenHeight*0.35,
                fit: BoxFit.cover,
                color: Color.fromRGBO(255, 255, 255, 0.5),
                colorBlendMode: BlendMode.modulate,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(15.0,0,0,15.0),
                child: Text(
                  'VegeLine',
                  style: TextStyle(
                    fontSize:45.0,
                    color: Color(0xEBEBEBEB),
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        offset: Offset(0, 3.0),
                        blurRadius: 3.0,
                        color: Color.fromRGBO(255, 255, 255, 0.6),
                      ),
                    ]
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: screenHeight*0.65,
            padding: EdgeInsets.fromLTRB(15.0,5.0,15.0,5.0),
            decoration: BoxDecoration(
                color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),)
            ),
            child: Form(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20.0,),
                  Text(
                    'Sign in to get started',
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  TextFormField(
                    onChanged: (value){
                      setState(() {
                        username = value;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Username / Email address',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))
                      ),
                      contentPadding: EdgeInsets.all(12.0),
                    ),
                  ),
                  SizedBox(height: 15.0,),
                  TextFormField(
                    onChanged: (value){
                      setState(() {
                        password = value;
                      });
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
                  SizedBox(height: 10.0,),
                  GestureDetector(
                    onTap: () => passwordReset(),
                    child: Align(
                      alignment: const Alignment(1, 0),
                      child: Text(
                        'Forgot your password?',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 40.0,),
                  ButtonTheme(
                    minWidth: screenWidth*0.9,
                    height: 50.0,
                    child: RaisedButton(
                      onPressed: (){
                        if(password != null && username != null){
//                          print(password);
                          login(password,username,context);
                        }
                      },
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                      color: Colors.grey[800],
                      shape: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40.0)),
                        borderSide: BorderSide(
                          color: Colors.grey[800],
                          width: 1.0,
                          style: BorderStyle.solid,
                        )
                      ),
                    ),
                  ),
                  SizedBox(height: 12.0,),
                  GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder:(context)=>Register()),
                    ),
                    child: Text(
                      "Have no account? Let's get that done here",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
