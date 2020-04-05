import 'package:flutter/material.dart';
import 'package:vege_line/wrapper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'OpenSans',
        primaryIconTheme: IconThemeData(color:Colors.black),
        primarySwatch: Colors.grey,
      ),
      home: Wrapper(),
      debugShowCheckedModeBanner: false,
    );
  }
}