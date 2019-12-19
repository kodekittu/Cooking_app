import 'package:flutter/material.dart';

import '../dummy-data.dart';

class MealDetailScreen extends StatelessWidget {

  static const routeName = '/meal-detail';

  final Function toggleFavorite;
  final Function isFavorite;

  MealDetailScreen(this.toggleFavorite,this.isFavorite);

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }
  /*
  Widget buildContainer(Widget child){
    return Container(

        decoration: BoxDecoration(
        color: Colors.white70,
        border: Border.all(color: Colors.grey),
      borderRadius: BorderRadius.circular(10),
    ),
     margin: EdgeInsets.all(10),
     padding: EdgeInsets.all(8),
     height: 230,
     width: 310,
     child: child  ,
    );
  }
  */

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      appBar: AppBar(title: Text('${selectedMeal.title}'),),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
         Container(
          width: double.infinity,
          height: 250,
          child: Image.network(selectedMeal.imageUrl,
          fit: BoxFit.cover,
          ),
        ),
          buildSectionTitle( context, 'Ingredients'),
          Container(
            decoration: BoxDecoration(
              color: Colors.white70,
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            margin: EdgeInsets.all(8),
            padding: EdgeInsets.all(8),
            height: 170,
            width: 310,
            child: ListView.builder(
               itemBuilder: (ctx, index) => Card(
                 color: Theme.of(context).accentColor,
                 child: Padding(
                   padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                   child: Text(selectedMeal.ingredients[index]),
                 ),
               ),
               itemCount: selectedMeal.ingredients.length,
           ),
         ),
          buildSectionTitle( context, 'Steps'),
          Container(
            decoration: BoxDecoration(
              color: Colors.white70,
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(8),
            height: 300,
            width: 310,
            child: ListView.builder(
              itemCount: selectedMeal.steps.length,
              itemBuilder: (ctx, index) => Column(children: <Widget> [
                ListTile(
                leading: CircleAvatar(
                  child: Text('#${(index + 1)}',style: TextStyle(fontWeight: FontWeight.bold),),
                ),
                title: Text(selectedMeal.steps[index]),
               ),
                Divider(),
              ],),
            ),
          ),
    ],),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:()=> toggleFavorite(mealId),
        child: Icon(isFavorite(mealId) ? Icons.favorite : Icons.favorite_border,color: Colors.red,),
      ),
    );
  }
}
