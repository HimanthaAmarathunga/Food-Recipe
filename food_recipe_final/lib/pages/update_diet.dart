import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_recipe_final/model/diat.dart';
import 'package:food_recipe_final/pages/diat_list.dart';
import 'package:http/http.dart' as http;
import 'package:food_recipe_final/pages/beverage_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'navBar.dart';

class UpdateDiet extends StatelessWidget {
  final Diet diet;

  const UpdateDiet({Key? key, required this.diet}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var name = diet.name.toString(),
        age = diet.age.toString(),
        weight = diet.weight.toString(),
        breakfast = diet.breakfast.toString(),
        lunch = diet.lunch.toString(),
        dinner = diet.name.toString();
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Diet Details"),
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
                  // "Diet Plan Name",
                  diet.id.toString(),
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
                  "Age or Age Group",
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
                  controller: TextEditingController(text: age),
                  cursorColor: Color(0xff14DDAF),
                  decoration: InputDecoration(
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none),
                  onChanged: (value) {
                    age = value;
                  },
                ),
              ),
              SizedBox(height: 55),
              Padding(
                padding: EdgeInsets.only(left: 25, right: 20),
                child: Text(
                  "Weight",
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
                  controller: TextEditingController(text: weight),
                  cursorColor: Color(0xff14DDAF),
                  decoration: InputDecoration(
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none),
                  onChanged: (value) {
                    weight = value;
                  },
                ),
              ),
              SizedBox(height: 55),
              Padding(
                padding: EdgeInsets.only(left: 25, right: 20),
                child: Text(
                  "Breakfast",
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
                  controller: TextEditingController(text: breakfast),
                  cursorColor: Color(0xff14DDAF),
                  decoration: InputDecoration(
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none),
                  onChanged: (value) {
                    breakfast = value;
                  },
                ),
              ),
              SizedBox(height: 55),
              Padding(
                padding: EdgeInsets.only(left: 25, right: 20),
                child: Text(
                  "Lunch",
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
                  controller: TextEditingController(text: lunch),
                  cursorColor: Color(0xff14DDAF),
                  decoration: InputDecoration(
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none),
                  onChanged: (value) {
                    lunch = value;
                  },
                ),
              ),
              SizedBox(height: 55),
              Padding(
                padding: EdgeInsets.only(left: 25, right: 20),
                child: Text(
                  "Dinner",
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
                  controller: TextEditingController(text: dinner),
                  cursorColor: Color(0xff14DDAF),
                  decoration: InputDecoration(
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none),
                  onChanged: (value) {
                    dinner = value;
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
                      update_class(diet.id.toString(), name, age, weight,
                          breakfast, lunch, dinner, context);
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
                  deleteClass(diet.id.toString(), context);
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
      dietID, name, age, weight, breakfast, lunch, dinner, context) async {
    if (dietID != Null) {
      print(jsonEncode({
        "Test before id": dietID,
        "name": name,
        "age": age,
        "weight": weight,
        "breakfast": breakfast,
        "lunch": lunch,
        "dinner": dinner,
      }));
      var response = await http.put(
          'https://recipe-app-ctse.herokuapp.com/diet/update',
          body: jsonEncode({
            "id": dietID,
            "name": name,
            "age": age,
            "weight": weight,
            "breakfast": breakfast,
            "lunch": lunch,
            "dinner": dinner,
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
          MaterialPageRoute(builder: (context) => const DiatList()),
        );
      }

      print("Updated Data" + response.body.toString());
    }
  }

  void deleteClass(dietID, context) async {
    if (dietID != Null) {
      var response = await http.delete(
          Uri.parse(
              'https://recipe-app-ctse.herokuapp.com/diet/delete/${dietID}'),
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
            context, MaterialPageRoute(builder: (context) => const DiatList()));
      }

      print("Deleted Data" + response.body.toString());
    }
  }
}
