import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saman/routs.dart';
import 'package:saman/screens/homescreen/homepage.dart';
import 'package:saman/screens/loginscreen/loginpage.dart';
import 'package:saman/screens/splashscreen/splashscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
      darkTheme: ThemeData(brightness: Brightness.dark),
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.splashscreenRoute,
      routes: {
        "/": (context) => SplashScreen(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.splashscreenRoute: (context) => SplashScreen(),
      },
    );
  }
}
