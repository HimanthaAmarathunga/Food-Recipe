import 'package:flutter/material.dart';
import 'package:food_recipe_final/model/beverage.dart';
import 'package:food_recipe_final/pages/recipe_details.dart';
import 'package:food_recipe_final/pages/update_beverages.dart';
import 'package:food_recipe_final/theme/colors.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class BevarageList extends StatefulWidget {
  const BevarageList({Key? key}) : super(key: key);

  @override
  State<BevarageList> createState() => _BevarageListState();
}

class _BevarageListState extends State<BevarageList> {
  List<Beverages> beverages = [];
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.fetchBeverages();
  }

  fetchBeverages() async {
    setState(() {
      isLoading = true;
    });
    var url =
        "https://recipe-app-ctse.herokuapp.com/beverageRecipes/getBeverages";
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      for (var item in items) {
        var id = item['id'];
        var name = item['name'];
        var description = item['description'];
        var ingredients = item['ingredients'];

        Beverages beverage = Beverages(id, name, description, ingredients);
        beverages.add(beverage);
        setState(() {
          isLoading = false;
        });
      }
    } else {
      setState(() {
        beverages = [];
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listing Beveragers"),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    if (beverages.contains(null) || beverages.length < 0 || isLoading) {
      return Center(
        child: CircularProgressIndicator(
          valueColor: new AlwaysStoppedAnimation<Color>(primary),
        ),
      );
    } else {
      return ListView.builder(
          itemCount: beverages.length,
          itemBuilder: (context, index) {
            return getCard(beverages[index]);
          });
    }
  }

  Widget getCard(item) {
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
                  image: const DecorationImage(
                      image: NetworkImage(
                          "https://1.bp.blogspot.com/-yGrvtdT3Mhk/X9pIX0zkT6I/AAAAAAAABTw/QkOpEkxGjtMSfMa9LgtZwmoXHWj7HY35QCLcBGAsYHQ/s2048/pexels-naim-benjelloun-2110923-min.jpg"),
                      fit: BoxFit.cover)),
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
                  item.description.toString(),
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
              builder: (context) => UpdateBeverage(beverage: item),
            ),
          );
        },
      ),
    ));
  }
}
