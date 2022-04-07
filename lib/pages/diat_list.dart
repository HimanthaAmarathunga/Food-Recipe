import 'package:flutter/material.dart';
import 'package:food_recipe/model/diat.dart';
import 'package:food_recipe/theme/colors.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class DiatList extends StatefulWidget {
  const DiatList({Key? key}) : super(key: key);

  @override
  State<DiatList> createState() => _DiatListState();
}

class _DiatListState extends State<DiatList> {
  List<Diat> diats = [];
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.fetchDiats();
  }

  fetchDiats() async {
    setState(() {
      isLoading = true;
    });
    var url = "https://recipe-app-ctse.herokuapp.com/diet/getAll";
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var items = json.decode(response.body);

      for (var item in items) {
        var dietId = item['dietId'];
        var name = item['name'];
        var age = item['age'];
        var weight = item['weight'];
        var breakfast = item['breakfast'];
        var lunch = item['lunch'];
        var dinner = item['dinner'];

        Diat diat = Diat(dietId, age, weight, breakfast, lunch, dinner, name);
        diats.add(diat);
        isLoading = false;
      }
    } else {
      setState(() {
        diats = [];
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listing Diat Plans"),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    if (diats.contains(null) || diats.length < 0 || isLoading) {
      return Center(
        child: CircularProgressIndicator(
          valueColor: new AlwaysStoppedAnimation<Color>(primary),
        ),
      );
    }
    return ListView.builder(
        itemCount: diats.length,
        itemBuilder: (context, index) {
          return getCard(diats[index]);
        });
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
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://images.medicinenet.com/images/article/main_image/what-is-the-best-meal-plan-for-losing-weight.jpg"),
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
                  "Age Group - " + item.age.toString(),
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
        // onTap: () {
        //   Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) =>
        //           RecipeDetails(recipe: item),
        //     ),
        //   );
        // },
      ),
    ));
  }
}
