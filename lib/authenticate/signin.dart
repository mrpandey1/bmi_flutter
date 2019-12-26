import 'package:bmi/mainservices/auth.dart';
import 'package:bmi/shared/decoration.dart';
import 'package:bmi/shared/loading.dart';
import 'package:flutter/material.dart';

class signin extends StatefulWidget {
  final Function toggleView;
  signin({this.toggleView});
  @override
  _signinState createState() => _signinState();
}

class _signinState extends State<signin> {
final _formKey=GlobalKey<FormState>();
final AuthServices _auth=AuthServices();
String email='';
String password='';
String error=''; 
bool loading=false;
  @override
  Widget build(BuildContext context) {
    return loading ?  Loading(): Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.brown[50],
      appBar: AppBar(title: Text('Login to BMI'),
      automaticallyImplyLeading: false,
      backgroundColor: Colors.pink[600],
      actions: <Widget>[
        FlatButton.icon(
          icon: Icon(Icons.person),
          label: Text('Register'),
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
              decoration:textInputDecoration.copyWith(hintText: 'Email'),
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
              child: Text('login',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),),
            ),
            onPressed: ()async{
            if(_formKey.currentState.validate())
              {
                 setState(()=>loading=true);
                 dynamic result=await _auth.signInWithEmailPassword(email, password);  
                 if(result==null)
                 {
                   setState(() {
                     error='invalid credentials';
                     loading=false;
                   });
                 }
              }
            },
            
          ), SizedBox(height: 20,),
          RaisedButton(
            color: Colors.pink[500],
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Text('Skip?',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),),
            ),
            onPressed: ()async{
                 setState(()=>loading=true);
                 dynamic result =await _auth.signInAnon(); 
                 if(result==null) {
                   setState(() {
                     error = 'Something went wrong please try through signIn';
                     loading = false;
                   });
                 }
            },
            
          ),
          SizedBox(height: 20,),
          Text(error,
          style: TextStyle(
            color: Colors.red,
          ),
          ),
          
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