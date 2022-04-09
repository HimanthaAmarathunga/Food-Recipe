import 'package:flutter/material.dart';
import 'package:food_recipe_final/model/beverage.dart';
import 'package:food_recipe_final/pages/AddBeverages/addBeverage.dart';

import 'package:http/http.dart' as http;
import 'package:food_recipe_final/pages/OneRec/OneRecord.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

var id = "";

class AllBeverageList extends StatefulWidget {
  const AllBeverageList({Key? key}) : super(key: key);

  @override
  State<AllBeverageList> createState() => _classListGetState();
}

class _classListGetState extends State<AllBeverageList> {
  Future<List<Beverages>> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    id = prefs.getString('id').toString();
    var url = Uri.parse(
        'https://recipe-app-ctse.herokuapp.com/beverageRecipes/getBeverages/$id',
    );

    late http.Response response;
    List<Beverages> users = [];

    try {
      response = await http.get(url);
      if (response.statusCode == 200) {
        Map peopleData = jsonDecode(response.body);
        print(peopleData);
        List<dynamic> peoples = peopleData["data"];

        for (var item in peoples) {
          var id = item['id'];
          var name = item['name'];
          var description = item['description'];
          var ingredients = item['ingredients'];

          Beverages user = Beverages(id,name,description,ingredients);
          users.add(user);
        }
      } else {
        return Future.error("Something went wrong!!!,${response.statusCode}");
      }
    } catch (e) {
      return Future.error(e.toString());
    }
    return users;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("All Beverages"),
        elevation: 1,
      ),
      body: profile(height, width),
    );
  }

  profile(double height, double width) {
    return Stack(children: [
      Positioned(
        left: 0,
        right: 0,
        bottom: 0,
        top: 0,
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              height: height * 0.8,
              width: width,
              child: FutureBuilder(
                  future: getUser(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: Text('Waiting!!!'),
                      );
                    } else {
                      if (snapshot.hasError) {
                        return Text(snapshot.error.toString());
                      } else {
                        return ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              title: Text(snapshot.data[index].title),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        BeverageDetails(snapshot.data[index]),
                                  ),
                                );
                              },
                            );
                          },
                        );
                      }
                    }
                  }),
            ),
          ],
        ),
      ),
      // child1(),
    ]);
  }

  Widget child1() {
    return Positioned(
      child: Container(
        margin: EdgeInsets.only(left: 10, top: 25),
        alignment: Alignment.topLeft,
        child: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.blue),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
    );
  }
}
