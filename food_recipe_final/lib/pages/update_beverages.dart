import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_recipe_final/model/beverage.dart';
import 'package:http/http.dart' as http;
import 'package:food_recipe_final/pages/beverage_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'navBar.dart';

class UpdateBeverage extends StatelessWidget {
  final Beverages beverage;

  const UpdateBeverage({Key? key, required this.beverage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var name = beverage.name.toString(),
        description = beverage.description.toString(),
        ingredients = beverage.ingredients.toString();
    bool isLoading = false;
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: Text("Update Beverage Details"),
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
                  "Beverage Name",
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
                    print(ingredients);
                  },
                ),
              ),
              SizedBox(
                height: 200,
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
                      update_class(beverage.id.toString(), name, description,
                          ingredients, context);
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
                  deleteClass();
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

  void update_class(BeverageID, name, description, ingredients, context) async {
    if (BeverageID != Null) {
      var response = await http.put(
          'https://recipe-app-ctse.herokuapp.com/beverageRecipes/update',
          body: jsonEncode({
            "id": BeverageID,
            "name": name,
            "description": description,
            "ingredients": ingredients,
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
          MaterialPageRoute(builder: (context) => const BevarageList()),
        );
      }

      print("Updated Data" + response.body.toString());
    }
  }

  void deleteClass() async {
    var BeverageID = "";

    final sharePref = await SharedPreferences.getInstance();
    BeverageID = sharePref.getString('BeverageID').toString();
    print("Record ID : $BeverageID");

    if (BeverageID != Null) {
      var response = await http.delete(
          Uri.parse(
              'https://recipe-app-ctse.herokuapp.com/beverageRecipes/delete/${BeverageID}'),
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
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => Homepage()));
      }

      print("Deleted Data" + response.body.toString());
    }
  }
}
