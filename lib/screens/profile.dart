import 'package:flutter/material.dart';
class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Text("Id Card",
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        centerTitle: true,
      ),
      body:
      Padding(
        padding: const EdgeInsets.fromLTRB(30.0,30.0,30.0,0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/nishant.jpg'),
                radius: 50.0,
              ),
            ),
            Divider(
              height: 60,
              color: Colors.grey[800],
            ),
            Text("Name",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 1.0,
                fontSize: 18.0,
              ),
            ),
            SizedBox(height: 15.0),
            Text("Nishant Pandey",
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.amber,
              ),),
            SizedBox(height: 30.0),
            Text("Phone",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 1.0,
                fontSize: 18.0,
              ),
            ),
            SizedBox(height: 15.0),
            Text("8208126215",
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.amber,
              ),),
            SizedBox(height: 30.0),
            Row(
              children: <Widget>[
                Icon(
                  Icons.mail,
                  color: Colors.white,
                ),
                SizedBox(width: 10.0),
                Text('pandeynishant12345@gmail.com',
                  style: TextStyle(
                    color: Colors.amber,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),

    );
  }
}



