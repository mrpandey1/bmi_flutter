// import 'package:bmi/modal/details.dart';
// import 'package:bmi/screens/userdata.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class BrewList extends StatefulWidget {
//   @override
//   _BrewListState createState() => _BrewListState();
// }

// class _BrewListState extends State<BrewList> {
//   @override
//   Widget build(BuildContext context) {
//     final details=Provider.of<List<Details>>(context)??[];
//     //print(brews);
//     //printing the collections of firebase
   
//     return ListView.builder(
//       itemCount: details.length,
//       itemBuilder: (context,index){
//         return BrewTile(brew: details[index]);
//       },
//     );
//   }
// }