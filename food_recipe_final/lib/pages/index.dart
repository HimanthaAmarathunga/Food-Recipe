import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:food_recipe_final/pages/beverage_list.dart';
import 'package:food_recipe_final/pages/diat_list.dart';
import 'package:food_recipe_final/pages/recipe_list.dart';
import 'package:food_recipe_final/pages/tips_list.dart';
import 'package:food_recipe_final/theme/colors.dart';

import 'navBar.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    return Container(
      child: StaggeredGrid.count(
        crossAxisCount: 2,
        crossAxisSpacing: 18,
        mainAxisSpacing: 18,
        children: [
          StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 1,
              child: Card(
                  color: widget_color,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  shadowColor: Colors.black87,
                  margin: EdgeInsets.only(left: 18, right: 18, top: 18),
                  child: Padding(
                      padding: EdgeInsets.all(24.0),
                      child: ListTile(
                        title: Row(
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Center(
                                  child: Text(
                                    "Recepies",
                                    style: TextStyle(
                                      fontSize: 32,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              width: 50,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              "https://www.pngall.com/wp-content/uploads/8/Cooking-Recipe-PNG-High-Quality-Image.png"),
                                          fit: BoxFit.cover)),
                                )
                              ],
                            )
                          ],
                        ),
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RecipeList())),
                      )))),
          StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 1,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                shadowColor: Colors.black87,
                margin: EdgeInsets.only(left: 18, right: 4, bottom: 18),
                child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: ListTile(
                          title: Column(
                            children: <Widget>[
                              Row(
                                // mainAxisAlignment: MainAxisAlignment.center,
                                // crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Text(
                                    "Beverages",
                                    style: TextStyle(
                                      fontSize: 22,
                                    ),
                                    // textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                "https://purepng.com/public/uploads/large/purepng.com-cocktailgeneric-alcoholic-mixed-drinkdrinkcocktailbeverage-1411527240649x0prc.png"),
                                            fit: BoxFit.cover)),
                                  )
                                ],
                              )
                            ],
                          ),
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BevarageList())),
                        ))),
              )),
          StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 1,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                shadowColor: Colors.black87,
                margin: EdgeInsets.only(left: 4, right: 18, bottom: 18),
                child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: ListTile(
                          title: Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                // crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Center(
                                    child: Text(
                                      "Tips",
                                      style: TextStyle(
                                        fontSize: 22,
                                      ),
                                      // textAlign: TextAlign.center,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                "https://pixel4agency.com/img/idea-vector-icon-png_277457.jpg"),
                                            fit: BoxFit.cover)),
                                  )
                                ],
                              )
                            ],
                          ),
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const TipsList())),
                        ))),
              )),
          StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 1,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                shadowColor: Colors.black87,
                margin: EdgeInsets.only(left: 18, right: 4, bottom: 18),
                child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: ListTile(
                          title: Column(
                            children: <Widget>[
                              Row(
                                // mainAxisAlignment: MainAxisAlignment.center,
                                // crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Text(
                                    "Diet Plans",
                                    style: TextStyle(
                                      fontSize: 22,
                                    ),
                                    // textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                "https://foodmanagementsystems.com/wp-content/uploads/2018/08/food-chart.png"),
                                            fit: BoxFit.cover)),
                                  )
                                ],
                              )
                            ],
                          ),
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DiatList())),
                        ))),
              )),
          StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 1,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                shadowColor: Colors.black87,
                margin: EdgeInsets.only(left: 4, right: 18, bottom: 18),
                child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: ListTile(
                          title: Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                // crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Center(
                                    child: Text(
                                      "User",
                                      style: TextStyle(
                                        fontSize: 22,
                                      ),
                                      // textAlign: TextAlign.center,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                "https://upload.wikimedia.org/wikipedia/commons/9/99/Sample_User_Icon.png"),
                                            fit: BoxFit.cover)),
                                  )
                                ],
                              )
                            ],
                          ),
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const DiatList())),
                        ))),
              ))
        ],
      ),
    );
  }
}
