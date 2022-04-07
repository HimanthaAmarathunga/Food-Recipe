import 'package:flutter/material.dart';
import 'package:food_recipe/pages/AddDiet/addDiet.dart';
import 'package:food_recipe/pages/index.dart';
import 'package:food_recipe/pages/recipe_list.dart';
import 'package:food_recipe/theme/colors.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primary
      ),
      home: addDiet(),
    )
  );
}

