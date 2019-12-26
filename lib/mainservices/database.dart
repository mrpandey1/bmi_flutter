import 'package:bmi/modal/User.dart';
import 'package:bmi/modal/details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class DatabaseServices
{
  final String uid;
  DatabaseServices({this.uid});
  //collection ie firebase collection reference
  final CollectionReference brewCollection=Firestore.instance.collection('Details');
  Future updateUserData(String name,int weight,int height) async
  {
    return await brewCollection.document(uid).setData({
      'name':name,
      'weight':weight,
      'height':height,
    });
}
   //brewList from snapshots
   List<Details> _brewListFromSnapshot(QuerySnapshot snapshot)
 {
   return snapshot.documents.map((doc)
   {
     return Details(
       name: doc.data['name'] ?? '',
       height: doc.data['height'] ?? 0,
       weight: doc.data['weight'] ?? 0
     );
   }).toList();
 }

// //userdata snapshot
//  UserData _userDataFromSnapshot(DocumentSnapshot snapshot)
//  {
//    return UserData(
//   uid: uid,
//    height: snapshot.data['height'],
//   name: snapshot.data['name']   ,
//   weight: snapshot.data['weight']
//     );
//  }
// //stream for data snapshots
//  Stream<UserData>  get userData{
//    return brewCollection.document(uid).snapshots()
//    .map(_userDataFromSnapshot);
//  }

//    Stream<List<Details>> get details
//    {
//      return brewCollection.snapshots().map(_brewListFromSnapshot);
//    }

}