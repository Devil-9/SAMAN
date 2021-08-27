import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saman/routs.dart';
import 'package:hexcolor/hexcolor.dart';

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => new SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  var _visible = true;

  late AnimationController animationController;
  late Animation<double> animation;

  startTime() async {
    var _duration = new Duration(seconds: 5);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.pushNamed(context, MyRoutes.loginRoute);
  }

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
        vsync: this, duration: new Duration(seconds: 3));
    animation =
        new CurvedAnimation(parent: animationController, curve: Curves.easeOut);

    animation.addListener(() => this.setState(() {}));
    animationController.forward();

    setState(() {
      _visible = !_visible;
    });
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#000000"),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          // new Column(
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   mainAxisSize: MainAxisSize.min,
          //   children: <Widget>[
          //     Padding(
          //         padding: EdgeInsets.only(bottom: 30.0),
          //         child: new Image.asset(
          //           'assets/images/powered_by.png',
          //           height: 25.0,
          //           fit: BoxFit.scaleDown,
          //         ))
          //   ],
          // ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Image.asset(
                'assets/images/mainlogo.png',
                width: animation.value * 250,
                height: animation.value * 250,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
