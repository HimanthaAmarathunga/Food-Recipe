import 'package:flutter/material.dart';
import 'package:food_recipe_final/theme/colors.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              SizedBox(
                width: 40,
              ),
              // Container(
              //   width: 80,
              //   height: 80,
              //   decoration: BoxDecoration(
              //       color: primary,
              //       borderRadius: BorderRadius.circular(20),
              //       image: DecorationImage(
              //           image: NetworkImage(
              //               "https://cdn.iconscout.com/icon/free/png-256/phone-2666572-2212584.png"),
              //           fit: BoxFit.cover)),
              // ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "          Our Vision",
                    style: TextStyle(fontSize: 30),
                  ),
                ],
              ),
              SizedBox(
                width: 20,
                height: 100,
              ),
            ],
          ),
          Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                SizedBox(
                width: 60,
              ),
               const SizedBox(
                width: 300,
                child: Center(child: Text("This is a Food Recipe Application created to help chefs who have all levels of expertise. The objective of this application is to help chefs learn how to cook different food and drinks while also learning about new kitchen tricks that will help them get things done easier.", textAlign: TextAlign.justify,),)
                // child: Text("This is a Food Recipe Application created to help chefs who have all levels of expertise. The objective of this application is to help chefs learn how to cook different food and drinks while also learning about new kitchen tricks that will help them get things done easier."),
                
              ),
              // Column(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: <Widget>[
              //     RichText(
              //       text: TextSpan(
              //         // style: DefaultTextStyle.of(context).style,
              //         children: <TextSpan> [
              //           TextSpan(
              //             text: 'This is a Food Recipe Application created to help chefs who have all levels of expertise. The objective of this application is to help chefs learn how to cook different food and drinks while also learning about new kitchen tricks that will help them get things done easier.'
              //           )
              //         ]
              //       ),
              //     ),
              //   ],
              // ),
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