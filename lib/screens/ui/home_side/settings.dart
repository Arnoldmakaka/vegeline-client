import 'package:flutter/material.dart';
import 'package:vege_line/screens/ui/home_side/edit_label.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(horizontal:12.0, vertical: 5.0),
            color: Colors.grey[300],
            child: Row(
              children: <Widget>[
                Text(
                  'Settings',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.w700,
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
          SizedBox(height: 15.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/IMG-20200325-WA0053.jpg'),
                  radius: 40,
                ),
                SizedBox(width: 20.0,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Ogou Nathan',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                    SizedBox(height: 5.0,),
                    Text('ogou@email.com')
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 10.0),
          Divider(),
          SizedBox(height: 15.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Text('My account', style: TextStyle(fontWeight:  FontWeight.w700, fontSize: 16.0),),
          ),
          SizedBox(height: 5.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Email Address',
                      style: TextStyle(
                        fontSize: 18.0
                      ),
                    ),
                    Text('ogou@email.com'),
                  ],
                ),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context)=>EditLabel(label: 'Email Address',)
                    ));
                  },
                )
              ],
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Phone Number',
                      style: TextStyle(
                        fontSize: 18.0
                      ),
                    ),
                    Text('+256770821234'),
                  ],
                ),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context)=>EditLabel(label: 'Phone Number',)
                    ));
                  },
                )
              ],
            ),
          ),
          SizedBox(height: 15.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Text('Other Settings', style: TextStyle(fontWeight:  FontWeight.w700, fontSize: 16.0),),
          ),
          Builder(
            builder:(context) => GestureDetector(
              onTap: (){
                Scaffold.of(context).showSnackBar(
                  SnackBar(content: Text('Coming soon!'))
                );
              },
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
                leading: Icon(Icons.notifications),
                title: Text('Notifications and Sounds'),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: Divider(),
          ),
          Builder(
            builder: (context) => GestureDetector(
              onTap: (){
                Scaffold.of(context).showSnackBar(
                  SnackBar(content: Text('Coming soon!'))
                );
              },
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
                leading: Icon(Icons.language),
                title: Text('Language'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}