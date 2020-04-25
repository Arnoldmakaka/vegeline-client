import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vege_line/app_state.dart';
import 'package:vege_line/wrapper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppState>(
      create: (context)=>AppState(),
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'OpenSans',
          primaryIconTheme: IconThemeData(
            color:Colors.blueGrey[900]
          ),
          primarySwatch: Colors.grey,
        ),
        home: Wrapper(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}