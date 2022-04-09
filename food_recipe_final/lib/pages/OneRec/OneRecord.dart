import 'package:flutter/material.dart';
import 'package:food_recipe_final/model/beverage.dart';
import 'package:shared_preferences/shared_preferences.dart';


var userType = "";
bool isVisble = true;

class BeverageDetails extends StatelessWidget {
  final Beverages user;

  BeverageDetails(this.user);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    SetclassID();
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
      ),
      body: profile(height, width, context),
    );
  }

  profile(double height, double width, BuildContext context) {
    final prefs = SharedPreferences.getInstance();

    return Scaffold(
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
                  "${user.name}",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: 65,
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
                  readOnly: true,
                  controller: TextEditingController()..text = user.name,
                  cursorColor: Color(0xff14DDAF),
                  decoration: InputDecoration(
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none),
                ),
              ),
              SizedBox(
                height: 50,
              ),
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
                  readOnly: true,
                  controller: TextEditingController()..text = user.ingredients,
                  cursorColor: Color(0xff14DDAF),
                  decoration: InputDecoration(
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none),
                ),
              ),
              SizedBox(
                height: 130,
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
                  // RaisedButton(
                  //   onPressed: () {
                  //     Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //           builder: (context) => EditBeverage(),
                  //         ));
                  //   },
                  //   color: Colors.orange,
                  //   padding: EdgeInsets.symmetric(horizontal: 50),
                  //   elevation: 2,
                  //   shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(0)),
                  //   child: Text(
                  //     "Update Record",
                  //     style: TextStyle(
                  //         fontSize: 14,
                  //         letterSpacing: 2.2,
                  //         color: Colors.white),
                  //   ),
                  // )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  SetclassID() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('beverageID', user.id);
  }

  Future<Widget> child1(BuildContext context) async {
    return Container(
      margin: EdgeInsets.only(left: 10, top: 25),
      alignment: Alignment.topLeft,
      child: IconButton(
        icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        onPressed: () => Navigator.of(context).pop(),
      ),
    );
  }
}
