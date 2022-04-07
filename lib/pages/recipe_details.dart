import 'package:flutter/material.dart';
import 'package:food_recipe/model/recipe.dart';

class RecipeDetails extends StatelessWidget {
  const RecipeDetails({Key? key, required this.recipe}) : super(key: key);

  final FoodRecipe recipe;
  Widget build(BuildContext context) {
    print(recipe);
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.id.toString()),
      ),
      body: Container(
        child: Text(recipe.name),
      ),
    );
  }
}
