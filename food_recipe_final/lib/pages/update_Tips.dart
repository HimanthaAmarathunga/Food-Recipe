import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_recipe_final/model/kitchen_tips.dart';
import 'package:food_recipe_final/pages/tips_list.dart';
import 'package:http/http.dart' as http;
import 'package:food_recipe_final/pages/beverage_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'navBar.dart';

class UpdateTips extends StatelessWidget {
  final KitchenTips kitchenTips;

  const UpdateTips({Key? key, required this.kitchenTips}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var name = kitchenTips.name.toString(),
        description = kitchenTips.description.toString();
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Kitchen Tips Details"),
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
                  "Tip Name",
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
                      update_class(kitchenTips.id.toString(), name,
                          description, context);
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
                  deleteClass(kitchenTips.id.toString(), context);
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

  void update_class(tipID, name, description, context) async {
    if (tipID != Null) {
      var response = await http.put(
          'https://recipe-app-ctse.herokuapp.com/kitchentips/update',
          body: jsonEncode({
            "id": tipID,
            "name": name,
            "descriptio": description,
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
          MaterialPageRoute(builder: (context) => const TipsList()),
        );
      }

      print("Updated Data" + response.body.toString());
    }
  }

  void deleteClass(tipID, context) async {
    if (tipID != Null) {
      var response = await http.delete(
          Uri.parse(
              'https://recipe-app-ctse.herokuapp.com/kitchentips/delete/${tipID}'),
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
            context, MaterialPageRoute(builder: (context) => const TipsList()));
      }

      print("Deleted Data" + response.body.toString());
    }
  }
}
