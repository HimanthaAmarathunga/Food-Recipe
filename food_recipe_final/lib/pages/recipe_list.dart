import 'package:flutter/material.dart';
import 'package:food_recipe_final/model/recipe.dart';
import 'package:food_recipe_final/pages/recipe_details.dart';
import 'package:food_recipe_final/theme/colors.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class RecipeList extends StatefulWidget {
  const RecipeList({Key? key}) : super(key: key);

  @override
  State<RecipeList> createState() => _RecipeListState();
}

class _RecipeListState extends State<RecipeList> {
  List<FoodRecipe> recipes = [];
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.fetchRecipes();
  }

  fetchRecipes() async {
    setState(() {
      isLoading = true;
    });
    var url = "https://recipe-app-ctse.herokuapp.com/foodRecipe/getAll";
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      for (var item in items) {
        var id = item['id'];
        var name = item['name'];
        var cookingTime = item['cookingTime'];
        var description = item['description'];
        var ingredients = item['ingredients'];
        var imageLink = item['imageLink'];

        FoodRecipe recipe = FoodRecipe(
            id, name, cookingTime, description, ingredients, imageLink);
        recipes.add(recipe);
      }
      isLoading = false;
    } else {
      setState(() {
        recipes = [];
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listing Recepices"),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    if (recipes.contains(null) || recipes.length < 0 || isLoading) {
      return Center(
        child: CircularProgressIndicator(
          valueColor: new AlwaysStoppedAnimation<Color>(primary),
        ),
      );
    }
    return ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          return getCard(recipes[index]);
        });
  }

  Widget getCard(item) {
    // var imurl;
    // if (item.imageLink == null || item.imageLink == '') {
    //   imurl =
    //       "https://images.immediate.co.uk/production/volatile/sites/30/2020/08/chorizo-mozarella-gnocchi-bake-cropped-9ab73a3.jpg?quality=90&resize=768,574";
    // } else {
    //   imurl = item.imageLink;
    // }

    return Card(
        child: Padding(
      padding: EdgeInsets.all(10.0),
      child: ListTile(
        title: Row(
          children: <Widget>[
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                  color: primary,
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: NetworkImage("https://images.immediate.co.uk/production/volatile/sites/30/2020/08/chorizo-mozarella-gnocchi-bake-cropped-9ab73a3.jpg?quality=90&resize=768,574"), fit: BoxFit.cover)),
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  item.name.toString(),
                  style: TextStyle(fontSize: 17),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  item.cookingTime.toString(),
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RecipeDetails(recipe: item),
            ),
          );
        },
      ),
    ));
  }
}
