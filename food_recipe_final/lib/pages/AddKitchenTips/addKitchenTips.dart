import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_recipe_final/pages/HomePage/home.dart';
import 'package:food_recipe_final/pages/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../navBar.dart';

class addKitchenTips extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<addKitchenTips> {
  @override
  Widget build(BuildContext context) {
    return initWidget();
  }

  Widget initWidget() {
    var tipNo = "";
    var name = "";
    var description = "";

    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        elevation: 1,
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Center(
                child: Text(
                  "Add Kitchen Tips",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 55,
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                padding: EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[200],
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 50,
                        color: Color(0xffEEEEEE))
                  ],
                ),
                child: TextField(
                  cursorColor: Color(0xff14DDAF),
                  decoration: InputDecoration(
                      hintText: "Tip Name",
                      border: OutlineInputBorder(),
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
              Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                padding: EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[200],
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 50,
                        color: Color(0xffEEEEEE))
                  ],
                ),
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  cursorColor: Color(0xff14DDAF),
                  decoration: InputDecoration(
                      hintText: "Description",
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none),
                  onChanged: (value) {
                    description = value;
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
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text("Cancel",
                        style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 2.2,
                            color: Colors.black)),
                  ),
                  RaisedButton(
                    onPressed: () {
                      {
                        addClass(tipNo, name, description);
                      }
                    },
                    color: Colors.orange,
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      "SAVE",
                      style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 2.2,
                          color: Colors.white),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void addClass(String tipNo, String name, String description) async {
    var tipNo = "";

    final prefs = await SharedPreferences.getInstance();
    tipNo = prefs.getString('tipNo').toString();
    try {
      var response = await http.post(
          Uri.parse("https://recipe-app-ctse.herokuapp.com/kitchentips/add"),
          body:jsonEncode( {
            "tipNo": tipNo,
            "name": name,
            "description": description
          }),
          headers: {
            "Accept": "application/json",
            "content-type": "application/json"
          });

      print("data" + response.body.toString());

      if (response.statusCode == 200) {
        Fluttertoast.showToast(
            msg: "New Kitchen Tip added successfully!",
            fontSize: 18,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.green,
            textColor: Colors.white);

        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => IndexPage(),
            ));
      }
    } catch (e) {
      print(e);
    }
  }
}
