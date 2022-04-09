import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_recipe_final/model/recipe.dart';
import 'package:food_recipe_final/pages/recipe_list.dart';
import 'package:http/http.dart' as http;

import 'navBar.dart';

class UpdateRecipe extends StatelessWidget {
  final FoodRecipe recipe;
  const UpdateRecipe({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var name = recipe.name.toString(),
        cookingTime = recipe.cookingTime.toString(),
        description = recipe.description.toString(),
        ingredients = recipe.ingredients.toString(),
        imageLink = recipe.imageLink.toString();
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Recipe Details"),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.only(left: 25, right: 20),
                child: Text(
                  "Recipe Name",
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 5),
                padding: EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey[200],
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 50,
                        color: Color(0xffEEEEEE))
                  ],
                ),
                child: TextField(
                  controller: TextEditingController(text: name),
                  cursorColor: Color(0xff14DDAF),
                  decoration: InputDecoration(
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none),
                  onChanged: (value) {
                    name = value;
                  },
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.only(left: 25, right: 20),
                child: Text(
                  "Cooking Time",
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 5),
                padding: EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey[200],
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 50,
                        color: Color(0xffEEEEEE))
                  ],
                ),
                child: TextField(
                  controller: TextEditingController(text: cookingTime),
                  cursorColor: Color(0xff14DDAF),
                  decoration: InputDecoration(
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none),
                  onChanged: (value) {
                    cookingTime = value;
                  },
                ),
              ),
              SizedBox(height: 55),
              Padding(
                padding: EdgeInsets.only(left: 25, right: 20),
                child: Text(
                  "Description",
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 5),
                padding: EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey[200],
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 50,
                        color: Color(0xffEEEEEE))
                  ],
                ),
                child: TextField(
                  controller: TextEditingController(text: description),
                  cursorColor: Color(0xff14DDAF),
                  decoration: InputDecoration(
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none),
                  onChanged: (value) {
                    description = value;
                  },
                ),
              ),
              SizedBox(height: 55),
              Padding(
                padding: EdgeInsets.only(left: 25, right: 20),
                child: Text(
                  "Ingredients",
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 5),
                padding: EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey[200],
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 50,
                        color: Color(0xffEEEEEE))
                  ],
                ),
                child: TextField(
                  controller: TextEditingController(text: ingredients),
                  cursorColor: Color(0xff14DDAF),
                  decoration: InputDecoration(
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none),
                  onChanged: (value) {
                    ingredients = value;
                  },
                ),
              ),
              SizedBox(height: 55),
              Padding(
                padding: EdgeInsets.only(left: 25, right: 20),
                child: Text(
                  "Image Link",
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 5),
                padding: EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey[200],
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 50,
                        color: Color(0xffEEEEEE))
                  ],
                ),
                child: TextField(
                  controller: TextEditingController(text: imageLink),
                  cursorColor: Color(0xff14DDAF),
                  decoration: InputDecoration(
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none),
                  onChanged: (value) {
                    imageLink = value;
                  },
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlineButton(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0)),
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text("Cancel",
                        style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 2.2,
                            color: Colors.black)),
                  ),
                  RaisedButton(
                    onPressed: () {
                      update_class(recipe.id.toString(), name, cookingTime,
                          description, ingredients,imageLink, context);
                    },
                    color: Colors.orange,
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0)),
                    child: Text(
                      "Update",
                      style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 2.2,
                          color: Colors.white),
                    ),
                  )
                ],
              ),
              RaisedButton(
                onPressed: () {
                  deleteClass(recipe.id.toString(), context);
                },
                color: Colors.red,
                padding: EdgeInsets.symmetric(horizontal: 50),
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0)),
                child: Text(
                  "Delete",
                  style: TextStyle(
                      fontSize: 14, letterSpacing: 2.2, color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
    ;
  }

  void update_class(
      id, name, cookingTime, description, ingredients, imageLink,context) async {
    if (id != Null) {
      var response = await http.put(
          'https://recipe-app-ctse.herokuapp.com/foodRecipe/update',
          body: jsonEncode({
            "id": id,
            "name": name,
            "cookingTime": cookingTime,
            "description": description,
            "ingredients": ingredients,
            "imageLink": imageLink,
          }),
          headers: {
            "Accept": "application/json",
            "content-type": "application/json"
          });

      if (response.statusCode == 200) {
        Fluttertoast.showToast(
            msg: "The Record Updated Successfully!!",
            fontSize: 18,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.green,
            textColor: Colors.white);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const RecipeList()),
        );
      }

      print("Updated Data" + response.body.toString());
    }
  }

  void deleteClass(recipeId, context) async {
    if (recipeId != Null) {
      var response = await http.delete(
          Uri.parse(
              'https://recipe-app-ctse.herokuapp.com/foodRecipe/delete/${recipeId}'),
          headers: {
            "Accept": "application/json",
            "content-type": "application/json"
          });

      if (response.statusCode == 200) {
        Fluttertoast.showToast(
            msg: "Deletion Successful!!",
            fontSize: 18,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.red,
            textColor: Colors.white);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => RecipeList()));
      }

      print("Deleted Data" + response.body.toString());
    }
  }
}
