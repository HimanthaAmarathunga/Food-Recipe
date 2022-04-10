import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:food_recipe_final/pages/index.dart';
import 'package:food_recipe_final/theme/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  // late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    // _controller = AnimationController(vsync: this);

    Timer(const Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const IndexPage()));
    });
  }

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 4),
    vsync: this,
  );

  late final Animation<Offset> _leftToRightAnim = Tween<Offset>(
    begin: const Offset(0.0, 0.0),
    end: Offset.zero,
  ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

  late final Animation<Offset> _rightToLeftAnim = Tween<Offset>(
    begin: const Offset(1.5, 0.0),
    end: Offset.zero,
  ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Container(
            //   width: 200,
            //   height: 200,
            //   decoration: BoxDecoration(
            //       color: primary,
            //       borderRadius: BorderRadius.circular(20),
            //       image: const DecorationImage(
            //           image.asset(
            //               "https://i.pinimg.com/originals/1b/34/30/1b34300f23f4a8a00020af4d661497d4.gif"),
            //           fit: BoxFit.cover)),
            // ),
            Image.asset(
              'assets/images/waiter.gif',
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SlideTransition(
                  position: _leftToRightAnim,
                  child: const Text(
                    "Digital Chef",
                    textScaleFactor: 2,
                  ),
                ),
                SlideTransition(
                  position: _rightToLeftAnim,
                  child: const Text(''),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
