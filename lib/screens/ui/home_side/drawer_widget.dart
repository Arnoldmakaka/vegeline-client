import 'package:flutter/material.dart';
import 'package:vege_line/screens/ui/home_side/menu_list_tile.dart';

class LeftDrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width*0.65,
      child: Drawer(
        child: ListView(
          children: <Widget>[
            // contain user information
            UserAccountsDrawerHeader(
              accountName: Text('Ogou Nathan'),
              accountEmail: Text('ogous@twos.com'),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/GEDC0900.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            MenuListTileWidget(),
          ],
        ),
      ),
    );
  }
}
