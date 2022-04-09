import 'package:flutter/material.dart';
import 'package:food_recipe_final/pages/AddDiet/addDiet.dart';
import 'package:food_recipe_final/pages/index.dart';
import 'package:food_recipe_final/pages/recipe_list.dart';
import 'package:food_recipe_final/theme/colors.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primary
      ),
      home: IndexPage(),
    )
  );
}

