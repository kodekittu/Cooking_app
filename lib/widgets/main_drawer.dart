import 'package:flutter/material.dart';

import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: <Widget>[
        Container(
          height: 120,
          width: double.infinity,
          color: Theme.of(context).accentColor,
          padding: EdgeInsets.all(20),
          alignment: Alignment.centerLeft,
          child: Text('Cooking Up!', style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 30,
              color: Theme.of(context).primaryColor),
          ),
        ),
        SizedBox(height: 20,),
        ListTile(
          onTap: () {Navigator.of(context).pushReplacementNamed('/');},
          leading: Icon(Icons.restaurant,size: 26,),
          title: Text('Meals',style: TextStyle(fontSize: 24,fontFamily: 'RobotoCondensed',fontWeight: FontWeight.w600),),
          ),
        ListTile(
          onTap: () {Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);},
          leading: Icon(Icons.settings,size: 26,),
          title: Text('Settings',style: TextStyle(fontSize: 24,fontFamily: 'RobotoCondensed',fontWeight: FontWeight.w600),),
        ),
      ],),
    );
  }
}
