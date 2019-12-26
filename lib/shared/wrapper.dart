import 'package:bmi/authenticate/authenticate.dart';
import 'package:bmi/modal/User.dart';
import 'package:bmi/screens/home.dart';
import 'package:bmi/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // return Loading();
     final  user =Provider.of<User>(context);
     if(user==null)
     {
     return Authenticate();
     } else{
       return Home();
     }
  }
}
