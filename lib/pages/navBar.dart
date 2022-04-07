import 'package:flutter/material.dart';
import 'package:food_recipe/pages/AddBeverages/addBeverage.dart';
import 'package:food_recipe/pages/HomePage/home.dart';
import 'package:food_recipe/pages/ViewBeverages/viewBeverages.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:food_recipe/pages/AddKitchenTips/addKitchenTips.dart';
import 'package:food_recipe/pages/AddDiet/addDiet.dart';

bool isLoading = false;

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<NavBar> {
  var user_Name = "", user_Email = "";
  @override
  void initState() {
    super.initState();
    getToken();
  }

  getToken() async {
    setState(() {
      isLoading = true;
    });
    // final prefs = await SharedPreferences.getInstance();
    // user_Email = prefs.getString('user_email').toString();
    // user_Name = prefs.getString('user_name').toString();

    // print("NavBar username" + user_Name);

    if (user_Name.length > 0) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 40,
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Home"),
            // onTap: () => null,
            onTap: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Homepage(),
                  ))
            },
          ),
          ListTile(
            leading: Icon(Icons.local_drink_sharp),
            title: Text("Add Beverage"),
            onTap: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => addBeverage(),
                  ))
            },
          ),
          ListTile(
            onTap: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AllBeverageList(),
                  ))
            },
            leading: Icon(Icons.emoji_food_beverage),
            title: Text("Beverages"),
          ),
          // ListTile(
          //   leading: Icon(Icons.local_drink_sharp),
          //   title: Text("Edit Beverage"),
          //   onTap: () => {
          //     Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //           builder: (context) => EditBeverage(),
          //         ))
          //   },
          // ),
          ListTile(
            leading: Icon(Icons.set_meal),
            title: Text("Add Diet"),
            onTap: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => addDiet(),
                  ))
            },
          ),
          ListTile(
            onTap: () {
              clearSharedPreferences();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => addKitchenTips(),
                ),
              );
            },
            leading: Icon(Icons.kitchen),
            title: Text("Add KitchenTips"),
          ),
        ],
      ),
    );
  }

  void clearSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    print("cleared");
  }
}
