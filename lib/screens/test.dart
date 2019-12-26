import 'package:flutter/material.dart';
class Test extends StatefulWidget {
  Test({Key key}):super(key:key);
  @override
  State<StatefulWidget> createState()
  {
    return new IndexTabState();
  }
}

class IndexTabState extends State<Test> {
  bool border1=false;
  bool border2=false;
  bool isMale=false;
  void borderChange(String val)
  {
    if(val=='first')
    {
      setState(() {
        border1=true;
        border2=false;
        isMale=true;
      });
    }
    if(val=='second'){
      setState(() {
        border1=false;
        border2=true;
        isMale=false;
      });
    }
  } 
  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FlatButton(
                  padding: EdgeInsets.symmetric(horizontal: 45,vertical: 45),
                  onPressed: (){
                    borderChange('first');
                  },
                  child: Text('Male',
                  style: TextStyle(
                    color: border1?Colors.pink:Colors.black,
                  ),
                  ),
                  shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10.0),
                  side: BorderSide(color: border1?Colors.pink:Colors.grey[300])),
                ),
              ),
               FlatButton(
                padding: EdgeInsets.symmetric(horizontal: 40,vertical: 45),
                onPressed: (){
                    borderChange('second');
                    },
                child: Text('Female',
                  style: TextStyle(
                    color: border2?Colors.pink:Colors.black,
                  ),
                  ),
                shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10.0),
                side: BorderSide(color: border2?Colors.pink:Colors.grey[300])),
              )
          ],
          ),
          //End of the first column of selecting gender

          //Start of getting Value from user

        ],
      );
  }
}