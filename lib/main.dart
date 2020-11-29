import 'package:flutter/material.dart';
import 'package:flutter_appa/src/providers/auth.dart';
import 'package:flutter_appa/src/screens/home.dart';
import 'package:flutter_appa/src/screens/login.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider.value(value: AuthProvider.initialize())
  ],
  child: MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Farmers' Market",
    theme: ThemeData(
      primarySwatch: Colors.green,
    ),
    home: ScreenController(),
  )));
}

class ScreenController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);
    switch(auth.status){
      case Status.Uninitialized:
        return Loading();
      case Status.Unauthenticated:
      case Status.Authenticating:
        return LoginScreen();
      case Status.Authenticated:
        return Home();
      default: return LoginScreen();
    }
  }
}

