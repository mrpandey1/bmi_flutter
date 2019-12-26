import 'package:bmi/authenticate/authenticate.dart';
import 'package:bmi/mainservices/auth.dart';
import 'package:bmi/modal/User.dart';
import 'package:bmi/screens/home.dart';
import 'package:bmi/screens/profile.dart';
import 'package:bmi/shared/decoration.dart';
import 'package:bmi/shared/loading.dart';
import 'package:bmi/shared/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MaterialApp(
  home: MyApp(),
  ));
//  initialRoute: '/',
//      routes:
//      {
//        '/': (context) => Authenticate(),
//        '/home': (context) => Home(),
//        '/profile':(context)=>Profile(),
//   }
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(value:AuthServices().user,
    child: MaterialApp(home: Loading(),
    ),
    );
  }
}