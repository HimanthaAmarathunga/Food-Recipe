import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../navBar.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: Text("Food Receipe"),
      ),
      body: profilenew(),
    );
  }

  profilenew() {
    return Stack(children: [
      Positioned(
        left: 0,
        right: 0,
        bottom: 0,
        top: 0,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                "Home Page",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}
