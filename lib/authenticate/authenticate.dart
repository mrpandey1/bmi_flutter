import 'package:bmi/authenticate/register.dart';
import 'package:bmi/authenticate/signin.dart';
import 'package:flutter/material.dart';
class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool isSignpage=true;
  void toggleView()
  {
    setState(() => isSignpage = !isSignpage);
  }
  @override
  Widget build(BuildContext context) {
     if(isSignpage)
    {
      return signin(toggleView:toggleView);
    }else{
      return Register(toggleView:toggleView);
    }
  }
}