import 'package:flutter/material.dart';
import 'package:vege_line/screens/ui/auth_side/register.dart';
import 'package:vege_line/screens/ui/auth_side/login.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Register(),
    );
  }
}
