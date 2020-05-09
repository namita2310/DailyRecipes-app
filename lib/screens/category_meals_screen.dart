import 'package:dailyrecipes/models/meals.dart';

import '../widgets/meal_items.dart';
import "package:flutter/material.dart";

import "../dummy_data.dart";

class CategoryMealsScreen extends StatefulWidget {
  // final String categoryid;
  static const routeName = "/category-meals";
  final List<Meal> availableMeals;
  
  CategoryMealsScreen(this.availableMeals); 

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle; 
  List<Meal> displayMeals;
  

  bool loadedinitdata=false;
  @override
void initState() {
    // TODO: implement initState
    
    super.initState();
  }
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    if(!loadedinitdata)
    {
      final routeargs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
     categoryTitle = routeargs["title"];
    final categoryId = routeargs["id"];
     displayMeals = widget.availableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    loadedinitdata=true;
    }
    

    super.didChangeDependencies();
  }
  void removeMeal(String mealID){
setState(() {
  displayMeals.removeWhere((meal)=> meal.id==mealID);
});
  }

  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id:displayMeals[index].id,
              title: displayMeals[index].title,
              imageUrl: displayMeals[index].imageUrl,
              duration:displayMeals[index].duration,
              affordability: displayMeals[index].affordability,
              complexity: displayMeals[index].complexity,
              
            );
          },
          itemCount: displayMeals.length,
        ));
  }
}
