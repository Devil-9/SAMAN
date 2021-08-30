import 'package:flutter/material.dart';
import 'package:saman/routs.dart';
import 'package:saman/services/authservice.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool changebutton = false;
  String email = "";
  String password = "";

  final _formkey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        changebutton = true;
      });

      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changebutton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              "assets/images/mainlogo.png",
              fit: BoxFit.cover,
              // height: 50.0,
              // width: 30,0,
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              "Welcome $email",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 32.0,
              ),
              child: Form(
                key: _formkey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Enter username",
                        labelText: "Username",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Username Can't be empty";
                        }

                        return null;
                      },
                      onChanged: (value) {
                        email = value;
                        setState(() {});
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Enter Password",
                        labelText: "Password",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Password Can't be empty";
                        } else if (value.length < 8) {
                          return "Password Can't be less than 8 digit";
                        }

                        return null;
                      },
                      onChanged: (value) {
                        password = value;
                        setState(() {});
                      },
                    ),
                    SizedBox(
                      height: 40.0,
                    ),

                    // Material(
                    //   color: Colors.deepPurple,
                    //   borderRadius: BorderRadius.circular(changebutton ? 50 : 8),
                    //   child: InkWell(
                    //     splashColor: Colors.red,
                    //     onTap: () => moveToHome(context),
                    //     child: AnimatedContainer(
                    //       duration: Duration(seconds: 1),
                    //       width: changebutton ? 50 : 150,
                    //       height: 40,
                    //       alignment: Alignment.center,
                    //       child: changebutton
                    //           ? Icon(
                    //               Icons.done,
                    //               color: Colors.white,
                    //             )
                    //           : Text(
                    //               "Login",
                    //               style: TextStyle(
                    //                 color: Colors.white,
                    //                 fontWeight: FontWeight.bold,
                    //                 fontSize: 18,
                    //               ),
                    //             ),
                    //     ),
                    //   ),
                    // ),

                    ElevatedButton(
                      onPressed: () {
                        AuthService().login(email, password).then((val) {
                          if (val.data['success']) {
                            Navigator.pushNamed(context, MyRoutes.homeRoute);
                          } else {
                            print("err");
                          }
                        });
                      },
                      child: Text("Login"),
                      style: TextButton.styleFrom(minimumSize: Size(150, 40)),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
