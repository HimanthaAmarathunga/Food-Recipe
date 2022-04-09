import 'package:flutter/material.dart';
import 'package:food_recipe_final/theme/colors.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact Us"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 40,
              ),
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                    color: primary,
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://cdn.iconscout.com/icon/free/png-256/phone-2666572-2212584.png"),
                        fit: BoxFit.cover)),
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "+94 77 948 0288",
                    style: TextStyle(fontSize: 17),
                  ),
                ],
              ),
              SizedBox(
                width: 20,
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 40,
              ),
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                    color: primary,
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://pnggrid.com/wp-content/uploads/2021/12/Transparent-Mail.png"),
                        fit: BoxFit.cover)),
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "tirone.lorence@gmail.com",
                    style: TextStyle(fontSize: 17),
                  ),
                ],
              ),
              SizedBox(
                width: 20,
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 40,
              ),
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                    color: primary,
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://static.thenounproject.com/png/2120976-200.png"),
                        fit: BoxFit.cover)),
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "No : 12, Kengalla, Kandy",
                    style: TextStyle(fontSize: 17),
                  ),
                ],
              ),
              SizedBox(
                width: 20,
              ),
            ],
          )
        ],
      ),
    );
  }
}
