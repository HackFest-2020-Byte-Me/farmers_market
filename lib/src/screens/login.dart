import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appa/src/helpers/screen_navigation.dart';
import 'package:flutter_appa/src/helpers/styles.dart';
import 'package:flutter_appa/src/providers/auth.dart';
import 'package:flutter_appa/src/screens/home.dart';
import 'package:flutter_appa/src/screens/registration.dart';
import 'package:flutter_appa/src/widgets/loading.dart';
import 'package:flutter_appa/src/widgets/textCustomized.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      key: _key,
      backgroundColor: white,
      body: authProvider.status == Status.Authenticating ? Loading(): SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,

            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("images/logo.png", width: 180, height: 180,),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: grey),
                  borderRadius: BorderRadius.circular(15)
                ),
                child: Padding(padding: EdgeInsets.only(left: 10),
                  child: TextFormField(
                    controller: authProvider.email,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Emails",
                        icon: Icon(Icons.email)
                    ),
                  ),
                ),

              ),
            ),

            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: grey),
                    borderRadius: BorderRadius.circular(15)
                ),
                child: Padding(padding: EdgeInsets.only(left: 10),
                  child: TextFormField(
                    controller: authProvider.password,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Password",
                        icon: Icon(Icons.lock)
                    ),
                  ),
                ),

              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: GestureDetector(
                onTap: ()async{
                  if(!await authProvider.signIn()){
                    _key.currentState.showSnackBar(
                      SnackBar(content: Text("Login failed"));
                      );
                    return;
                  }
                  authProvider.cleanController();
                  changeScreenReplacement(context, Home());
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: green,
                      border: Border.all(color: grey),
                      borderRadius: BorderRadius.circular(15)
                  ),
                  child: Padding(padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(text: "Login", color: white,size: 22,)
                      ],
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                changeScreen(context, RegistrationScreen());
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(text: "Register Here", size: 20,),
                ],
              ),
            )
          ],
        )
      )
    );
  }
}
