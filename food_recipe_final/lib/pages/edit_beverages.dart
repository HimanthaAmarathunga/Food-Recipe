import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_recipe_final/pages/HomePage/home.dart';
import 'package:food_recipe_final/pages/navBar.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


var name = "", description = "",ingredients="";
bool isLoading = false;

class EditBeverage extends StatelessWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<EditBeverage> {
  @override
  void initState() {
    getBeverageData();
    super.initState();
  }

  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
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
                  controller: TextEditingController()..text = name,
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
                  controller: TextEditingController()..text = name,
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
                  controller: TextEditingController()..text = name,
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
                  controller: TextEditingController()..text = ingredients,
                  cursorColor: Color(0xff14DDAF),
                  decoration: InputDecoration(
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none),
                  onChanged: (value) {
                    ingredients = value;
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
                      update_class();
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
  }

  Widget child1(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, top: 25),
      alignment: Alignment.topLeft,
      child: IconButton(
        icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        onPressed: () => Navigator.of(context).pop(),
      ),
    );
  }

  getBeverageData() async {
    setState(() {
      isLoading = true;
    });
    var BeverageID = "";

    final sharepref = await SharedPreferences.getInstance();
    BeverageID = sharepref.getString('BeverageID').toString();
    print("Beverage ID is : $BeverageID");

    if (BeverageID != Null) {
      var response = await http.get('https://recipe-app-ctse.herokuapp.com/beverageRecipes/findBeverageRecipeById/${BeverageID}');

      print("Response Data" + response.body.toString());

      name = response.body["data"]["name"].toString();
      description= response.body["data"]["description"].toString();
      ingredients= response.body["data"]["ingredients"].toString();

      if (response.statusCode == 200) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  void update_class() async {
    var BeverageID = "";

    final sharePref = await SharedPreferences.getInstance();
    BeverageID = sharePref.getString('BeverageID').toString();


    if (BeverageID != Null) {
      var response = await Dio().put(
              'https://recipe-app-ctse.herokuapp.com/beverageRecipes/update${BeverageID}',
          data: {
            "id": BeverageID,
            "name": name,
            "ingredients": ingredients,
          });

      if (response.statusCode == 200) {
        Fluttertoast.showToast(
            msg: "The Record Updated Successfully!!",
            fontSize: 18,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.green,
            textColor: Colors.white);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => EditBeverage()));
      }

      print("Updated Data" + response.data.toString());
    }
  }

  void deleteClass() async {
    var  BeverageID = "";

    final sharePref = await SharedPreferences.getInstance();
    BeverageID = sharePref.getString('BeverageID').toString();
    print("Record ID : $BeverageID");

    if (BeverageID != Null) {
      var response = await Dio().delete('https://recipe-app-ctse.herokuapp.com/beverageRecipes/delete/${BeverageID}');

      if (response.statusCode == 200) {
        Fluttertoast.showToast(
            msg: "Deletion Successful!!",
            fontSize: 18,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.red,
            textColor: Colors.white);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Homepage()));
      }

      print("Deleted Data" + response.data.toString());
    }
  }
}
