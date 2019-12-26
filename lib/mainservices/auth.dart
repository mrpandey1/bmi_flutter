import 'package:bmi/mainservices/database.dart';
import 'package:bmi/modal/User.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServices
{
  final FirebaseAuth _auth=FirebaseAuth.instance;
User _userFromFirebaseUser(FirebaseUser user)
  {
    return user !=null? User(uid:user.uid):null;
  }
  Stream<User> get user{
    return  _auth.onAuthStateChanged.map(_userFromFirebaseUser); 
  }
  //sign up
  Future userRegistrationwithEmailpassword(String email,String password) async
  {
    try{
      AuthResult result=await _auth.createUserWithEmailAndPassword(email: email,password: password);
      FirebaseUser user=result.user;
      await DatabaseServices(uid: user.uid).updateUserData('New User',60, 140); 
      return  user.uid;
    }catch(e)
    {
      print(e);
      return null;
    }
  } 
   Future inputData() async {
    final FirebaseUser user = await _auth.currentUser();
    final uid = user.uid;
    return uid;
    // here you write the codes to input the data into firestore
  }
  Future signInWithEmailPassword(String email,String password) async
  {
    try{
      AuthResult result=await _auth.signInWithEmailAndPassword(email: email,password: password);
      FirebaseUser user=result.user;
      return user.uid;
    }catch(e)
    {
      print(e);
      return null;
    }
  }
  Future signOut() async
  {
      try{
        return await _auth.signOut();
      
      }catch(e)
      {
        return null;
      }
  }
  Future signInAnon()async
  {
    try
    {
      AuthResult result=await _auth.signInAnonymously();
      FirebaseUser user=result.user;
      return user.uid;
    }catch(e)
      {
        print(e);
      }
  }
}