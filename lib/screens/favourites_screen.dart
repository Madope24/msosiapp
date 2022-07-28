import 'package:flutter/material.dart';

import '../meal.dart';
import '../meal_item.dart';
class FavouritesScreen extends StatelessWidget {
  //const FavouritesScreen({Key? key}) : super(key: key);
  final List<Meal> favoriteMeals;

  FavouritesScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty){
      return Center(
        child: Text('You have no favourites currently. Add some!'),
      );
    }else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favoriteMeals[index].id,
            title: favoriteMeals[index].title,
            imageUrl: favoriteMeals[index].imageUrl,
            duration: favoriteMeals[index].duration,
            affordability: favoriteMeals[index].affordability,
            complexity: favoriteMeals[index].complexity,
          );
        }, itemCount: favoriteMeals.length,
      );
  }


}
