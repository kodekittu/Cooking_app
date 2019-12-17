import 'package:flutter/material.dart';

import '../dummy-data.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
   //   appBar: AppBar(
       // title: Text('* Foooood *',style: TextStyle(fontWeight: FontWeight.bold),),
    //  ),
      body: GridView(
        padding: const EdgeInsets.all(25),
        children: DUMMY_CATEGORIES.map((catDate) => CategoryItem(catDate.id,catDate.title, catDate.color)).toList(),

        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
          childAspectRatio: 3/2, // ** height and width relation **
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),
    );
  }
}
