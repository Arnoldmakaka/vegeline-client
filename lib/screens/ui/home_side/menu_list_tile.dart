import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuListTileWidget extends StatefulWidget {
  @override
  _MenuListTileWidgetState createState() => _MenuListTileWidgetState();
}

class _MenuListTileWidgetState extends State<MenuListTileWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          leading: Icon(
            Icons.star,
            color: Colors.red,
          ),
          title: Text(
            'Favorites',
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
          onTap: (){},
        ),
        Divider(),
        ListTile(
          leading: Icon(
            Icons.restaurant,
            color: Colors.purple[500],
          ),
          title: Text(
            'Food Categories',
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
          onTap: (){},
        ),
        Divider(),
        ListTile(
          leading: Icon(
            Icons.notifications,
            color: Color.fromRGBO(0, 125, 135, 1),
          ),
          title: Text(
            'Notifications',
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
          onTap: (){},
        ),
        Divider(),
        ListTile(
          leading: Icon(
            Icons.settings,
            color: Color.fromRGBO(142,85,0,1),
          ),
          title: Text(
            'Settings',
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
          onTap: (){},
        ),
        Divider(),
        ListTile(
          leading: Icon(
            Icons.local_gas_station,
            color: Color.fromRGBO(168, 0, 0, 1),
          ),
          title: Text(
            'Terms and Policies',
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
          onTap: (){},
        ),
      ],
    );
  }
}
