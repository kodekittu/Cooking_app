import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meal';

  final List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {

  String categoryTitle;
  List<Meal> displayedMeals;
  var _loadedMealData = false;

 @override
  void didChangeDependencies() {
    if(!_loadedMealData) {
      final routeAgrs = ModalRoute.of(context).settings.arguments as Map<String, String>;
      final categoryId = routeAgrs['id'];
      // ignore: unused_local_variable
      final categoryTitle = routeAgrs['title'];
      // ignore: unused_local_variable
      final displayedMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }
      ).toList();
      _loadedMealData = true;
    }
    super.didChangeDependencies();
  }
 /* void _removeMeal (String mealId){
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }*/

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(itemBuilder: (ctx, index) {
        return MealItem(
            id: displayedMeals[index].id,
            title: displayedMeals[index].title,
            imageUrl: displayedMeals[index].imageUrl,
            duration: displayedMeals[index].duration,
            affordability: displayedMeals[index].affordability,
            complexity:displayedMeals[index].complexity,
        );
      },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
