import 'package:flutter/material.dart';
import 'package:flutter_appa/src/helpers/screen_navigation.dart';
import 'package:flutter_appa/src/helpers/styles.dart';
import 'package:flutter_appa/src/providers/auth.dart';
import 'package:flutter_appa/src/screens/home.dart';
import 'package:flutter_appa/src/screens/login.dart';
import 'package:flutter_appa/src/widgets/loading.dart';
import 'package:flutter_appa/src/widgets/textCustomized.dart';
import 'package:provider/provider.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      key: _key,
        backgroundColor: white,
        body: authProvider.status == Status.Authenticating? Loading() : SingleChildScrollView(
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
                        controller: authProvider.name,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Username",
                            icon: Icon(Icons.person)
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
                      if(!await authProvider.signUp()){
                        _key.currentState.showSnackBar(
                            SnackBar(content: Text("Registeration failed"));
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
                            CustomText(text: "Register", color: white,size: 22,)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    changeScreen(context, LoginScreen());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(text: "Login Here", size: 20,),
                    ],
                  ),
                )
              ],
            )
        )
    );
  }
}
