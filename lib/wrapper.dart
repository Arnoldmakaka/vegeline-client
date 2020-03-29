import 'package:flutter/material.dart';
import 'package:vege_line/screens/ui/home_side/home.dart';
import 'package:vege_line/screens/ui/auth_side/auth.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // returns either the auth widget or home widget
    return Container(
      child: AuthScreen(),
    );
  }
}
