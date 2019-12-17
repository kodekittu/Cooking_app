import 'package:cooking_app/screens/tabs_screen.dart';
import 'package:flutter/material.dart';

import './screens/category_meals_screen.dart';
import './screens/meal_details_screen.dart';
import 'screens/categories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cooking App',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          body1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
          body2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
          title: TextStyle(fontSize:20, fontFamily: 'RobotoCondensed', fontWeight: FontWeight.bold),
        ),
      ),
     // home: CategoriesScreen(), or  we can use route method
      initialRoute: '/',      //   ***********// default as '/'
      routes: {
        '/' : (ctx) => TabsScreen(),
        CategoryMealsScreen.routeName : (ctx) => CategoryMealsScreen(), //  or // '/category-meal': (ctx) => CategoryMealsScreen(),
        MealDetailScreen.routeName : (ctx) => MealDetailScreen(),
      },
      onUnknownRoute: (setting){
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      }, //  **** If Screen crachs or something happens ***
    );
  }
}

