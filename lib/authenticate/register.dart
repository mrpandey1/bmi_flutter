import 'dart:async';

import 'package:bmi/mainservices/auth.dart';
import 'package:bmi/screens/home.dart';
import 'package:bmi/shared/decoration.dart';
import 'package:bmi/shared/loading.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey=GlobalKey<FormState>();
final AuthServices _auth=AuthServices();
String email='';
String password='';
String error=''; 
bool loading=false;
  @override
  Widget build(BuildContext context) {
    return loading ? Loading():Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.brown[50],
      appBar: AppBar(title: Text('Register to BMI'),
      automaticallyImplyLeading: false,
      elevation: 0,
      backgroundColor: Colors.pink[600],
      actions: <Widget>[
        FlatButton.icon(
          icon: Icon(Icons.person),
          label: Text('Login'),
          onPressed: (){
            widget.toggleView();
          },
        )
      ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50,horizontal: 50),
        child: Form(
              key: _formKey,
          child: Column(children: <Widget>[
            TextFormField(
            decoration: textInputDecoration.copyWith(hintText: 'Email'),
              validator: (val)=>val.isEmpty?'please enter email':null,
            onChanged: (val)
            {
              setState(() =>email=val);
            },
           ),
          SizedBox(height: 10,),
           TextFormField(
             decoration: textInputDecoration.copyWith(hintText: 'Password'),
             obscureText: true,
              validator: (val)=>val.length<6?'please enter minimum 6 words in password':null,
            onChanged: (val)
            {
              setState(() =>password=val);
            },
          ),
          SizedBox(height: 20,),
          RaisedButton(
            color: Colors.pink[500],
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Text('Register',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),),
            ),
            onPressed: ()async{
              if(_formKey.currentState.validate())
              {
                setState(()=>loading=true);
                dynamic result=await _auth.userRegistrationwithEmailpassword(email, password);
                if(result==null)
                {
                setState((){
                  error='invalid email form or email already used'; 
                loading=false;
                });
                } 
              }
            },
          ),
          SizedBox(height: 30,),
          Text(error,
          style: TextStyle(
            color: Colors.red, 
            fontSize: 12,
          ),
          )
          ],),
        ),        
      ),
    
    );
  }
}








/*sign in anonymously
child: RaisedButton(
          onPressed: () async{
            dynamic result =await _auth.signInAnon();
            if(result==null)
            {
              print("something went wrong");
            }else{
              print('signed in');
              print(result.uid);
            }
          },
          child: Text('login'), 
        )
*/