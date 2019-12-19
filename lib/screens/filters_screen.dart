import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen(this.currentFilters,this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {

  bool _glutenFree = false;
  bool _vegan = false;
  bool _vegetarian = false;
  bool _lactoseFree = false;

  @override
  initState(){
    _glutenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegan = widget.currentFilters['vegan'];
    _vegetarian = widget.currentFilters['vegetarian'];
    super.initState();
  }

  Widget _buildSwitchListTile (
      String title, String subtitle, bool currentValue, Function updateValue,
      ){
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: currentValue,
      onChanged: updateValue
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.save),onPressed: () {
            final selectedFilters = {
              'gluten': _glutenFree,
              'lactose': _lactoseFree,
              'vegan' : _vegan,
              'vegetarian':_vegetarian,
            };
            widget.saveFilters(selectedFilters);
            },
          )
        ],
      ),
      body: Column(children: <Widget>[
        Container(
          padding: EdgeInsets.all(20),
          child: Text('Adjust your Meal selection',style: Theme.of(context).textTheme.title,),
        ),
        Expanded(
            child: ListView(children: <Widget>[
             _buildSwitchListTile('Gluten-free', 'Only include Gluten free Meals',_glutenFree,
                (newValue) { setState(() {
                  _glutenFree = newValue;
                });}
            ),
              _buildSwitchListTile('Lactose-free', 'Only include Lactose free Meals',_lactoseFree,
                      (newValue) { setState(() {
                    _lactoseFree = newValue;
                  });}
              ),
              _buildSwitchListTile('Vegan', 'Only include Gluten free Meals',_vegan,
                      (newValue) { setState(() {
                    _vegan = newValue;
                  });}
              ),
              _buildSwitchListTile('Vegetarian', 'Only include Vegetarian Meals',_vegetarian,
                      (newValue) { setState(() {
                    _vegetarian = newValue;
                  });}
              ),
        ],))
      ],),
    );
  }
}
