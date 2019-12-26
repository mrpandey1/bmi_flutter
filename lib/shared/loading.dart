import 'dart:async';

import 'package:bmi/authenticate/authenticate.dart';
import 'package:bmi/modal/User.dart';
import 'package:bmi/screens/home.dart';
import 'package:bmi/shared/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
     void initState() {
    super.initState();
    new Future.delayed(
        const Duration(seconds: 3),
        () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Wrapper()),
            ));
  }
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(height: 100,),
          Text('BMI calculator',style: TextStyle(fontSize: 30,color: Colors.white),),
          SizedBox(height: 10,),
          Text('-by Nishant',style: TextStyle(fontSize: 20,color: Colors.white),),
          SizedBox(height: 50,),
         Padding(
          padding: EdgeInsets.all(50),
          child: SpinKitWanderingCubes(
            color: Colors.white,
            //size: 50.0,
          ),
        ),
        ],
          
      ),
          backgroundColor: Colors.pink,
    );
  }
}