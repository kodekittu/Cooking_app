import 'package:flutter/material.dart';

import './categories_screen.dart';
import './favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  final List<Map<String, Object>> _pages = [
    {'page': CategoriesScreen(), 'title': '** FOOOOD **'},
    {'page': FavoritesScreen(), 'title': 'Favorites'},
  ];
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title'],style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        //type: BottomNavigationBarType.shifting,
        onTap: _selectPage,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        backgroundColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), title: Text('Categories'),backgroundColor: Theme.of(context).primaryColor,),
          BottomNavigationBarItem(
              icon: Icon(Icons.star_border), title: Text('Favorites'),backgroundColor: Theme.of(context).primaryColor,),
        ],
      ),
    );
  }
}


// ****** tab Bar at top  *******
/*  DefaultTabController(
      initialIndex: 0,  //  which screen will be open
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Meals'),
          bottom: TabBar(tabs: <Widget>[
            Tab(icon: Icon(Icons.category,),
                text: 'Category',
            ),
            Tab(icon: Icon(Icons.star_border,),
              text: 'Favorites',
            ),
          ]),
        ),
        body: TabBarView(children: <Widget>[
          CategoriesScreen(),
          FavoritesScreen(),
        ],
        ),
      ),
    );
    }
 */
