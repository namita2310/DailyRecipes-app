import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;
  final Map<String,bool> currentFilters;
  FiltersScreen(this.saveFilters,this.currentFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegan = false;
  bool _lactoseFree = false;
  bool _vegetarian = false;
  @override
  initStart(){
    _glutenFree=widget.currentFilters["gluten"];
    _vegan=widget.currentFilters["vegan"];
    _lactoseFree=widget.currentFilters["lactose"];
    _vegetarian=widget.currentFilters["vegetarian"];
    super.initState();
  }
  Widget buildSwitchListTile(
      String title, String description, bool currentval, Function update) {
    return SwitchListTile(
      title: Text(title),
      value: currentval,
      subtitle: Text(description),
      onChanged: update,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your Filters'), actions: <Widget>[
        IconButton(
          icon: Icon(Icons.save),
          onPressed: () {
            final Map<String, bool> _filters = {
              "gluten": _glutenFree,
              "lactose": _lactoseFree,
              "vegan": _vegan,
              "vegetarian": _vegetarian,
            };
            widget.saveFilters;
          },
        )
      ]),
      drawer: MainDrawer(),
      body: Column(children: <Widget>[
        Container(
          padding: EdgeInsets.all(20),
          child: Text(
            "Adjust your meal selection",
            style: Theme.of(context).textTheme.title,
          ),
        ),
        Expanded(
          child: ListView(
            children: <Widget>[
              buildSwitchListTile(
                "gluten-free",
                "Only inclue gluten-free meals!",
                _glutenFree,
                (newval) {
                  setState(
                    () {
                      _glutenFree = newval;
                    },
                  );
                },
              ),
              buildSwitchListTile(
                "Lactose-free",
                "Only inclue Lactose-free meals!",
                _lactoseFree,
                (newval) {
                  setState(
                    () {
                      _lactoseFree = newval;
                    },
                  );
                },
              ),
              buildSwitchListTile(
                "Vegetarian",
                "Only inclue vegetarian meals!",
                _vegetarian,
                (newval) {
                  setState(
                    () {
                      _vegetarian = newval;
                    },
                  );
                },
              ),
              buildSwitchListTile(
                "Vegan",
                "Only inclue Vegan meals!",
                _vegetarian,
                (newval) {
                  setState(
                    () {
                      _vegan = newval;
                    },
                  );
                },
              ),
            ],
          ),
        )
      ]),
    );
  }
}
