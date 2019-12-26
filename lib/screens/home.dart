import 'package:bmi/mainservices/auth.dart';
import 'package:bmi/modal/User.dart';
import 'package:bmi/screens/Result.dart';
import 'package:bmi/screens/test.dart';
import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Test test=Test();
  bool border1=true;
  bool border2=false;
  bool border3=false;
  bool border4=false;
  bool isMale=true;
  double bmi;
  String val='16';
  double _sliderValue = 10.0;
  double _heightvalue = 120.0;
  double _weight = 60;
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
  void borderChange2(String val)
  {
    if(val=='first')
    {
      border3=true;
      border4=false;
    }
    if(val=='second')
    {
      border3=false;
      border4=true;
    }
  }
  final AuthServices _auth=AuthServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Calculate by BMI '),
        backgroundColor: Colors.pink,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          FlatButton.icon(
            onPressed: (){
              _auth.signOut();
            },
            icon: Icon(Icons.person),
            label: Text('logout'),
          )
        ],
      ),
      //Starting of body 
       body: 
        Column(
         children: <Widget>[
          Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>[
               Padding(
                 padding: const EdgeInsets.fromLTRB(10, 20, 10,20),
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
           
            SizedBox(height: 20,),

           //Start of getting Value from user
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20
              ),
              margin: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 0
              ),
              decoration: BoxDecoration(
                border: Border.all(color :border3?Colors.pink:Colors.grey[300])
              ),
              child:Column(
                children: <Widget>[
                Text('${_sliderValue.toInt()} years',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20
                  ),
                  ),
                    Row(
                children: <Widget>[
                 Flexible(
                   flex: 1,
                      child: Slider(
                         activeColor: Colors.pink,
                         min: 5.0,
                         max: 50.0,
                         onChanged: (newRating) {
                           setState(() => _sliderValue = newRating);
                         },
                         value: _sliderValue,
                    ),
                 ),
                ],
              ),
              ],
              ),
            ),
             SizedBox(height: 20,),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20
                  ),
                  margin: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 0
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color :border4?Colors.pink:Colors.grey[300])
                  ),
                  child:Column(
                    children: <Widget>[
                    Text('${_heightvalue.toInt()} Centimeters',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20
                      ),
                      ),
                        Row(
                    children: <Widget>[
                     Flexible(
                       flex: 1,
                          child: Slider(
                            activeColor: Colors.pink,
                            min: 100.0,
                            max: 220.0,
                            onChanged: (newRating) {
                              setState(() => _heightvalue = newRating);
                            },
                            value: _heightvalue,
                        ),
                     ),
                    ],
                  ),
                  ],
                  ),
                ),
             SizedBox(height: 20,),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20
                  ),
                  margin: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 0
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color :border4?Colors.pink:Colors.grey[300])
                  ),
                  child:Column(
                    children: <Widget>[
                      Text('${_weight.toInt()} Kg',
                      style: TextStyle(
                        fontSize:  20,
                      ),
                      ),
                      SizedBox(height: 5,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                                FlatButton(
                                  color: Colors.pink,
                              child: Text('+',style:TextStyle(fontSize: 30,color: Colors.white),),
                              onPressed: (){
                                setState(() {
                                  _weight++;
                                });
                              },
                            ),
                            SizedBox(width: 10,),
                             FlatButton(
                                  color: Colors.pink,
                              child: Text('-',style:TextStyle(fontSize: 30,color: Colors.white),),
                              onPressed: (){
                                setState(() {
                                  _weight--;
                                });
                              },
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
            FlatButton(
              padding: EdgeInsets.symmetric(horizontal:150,vertical: 15),
              color: Colors.pink,
              onPressed: (){
                setState(() {
                  bmi=(_weight)/((_heightvalue/100)*(_heightvalue/100));
                  if(isMale==false)
                  {
                    if(bmi>35)
                      print('You are Extremly obese');
                    if(bmi>30 && bmi<34.99)
                      print('You are  obese');
                    if(bmi>25 && bmi<29.99)
                      print('You are overweight');
                    if(bmi>18.5 && bmi<24.99)
                      print('Congrats you are normal');
                    if(bmi<18.8)
                      print('You are  underweight');
                  }if(isMale==true)
                  {
                    if(bmi>35)
                      print('You are Extremly obese');
                    if(bmi>30 && bmi<34.99)
                      print('You are  obese');
                    if(bmi>25 && bmi<29.99)
                      print('You are overweight');
                    if(bmi>18.5 && bmi<24.99)
                      print('Congrats you are normal');
                    if(bmi<18.8)
                      print('You are  underweight');
                  }
                  print(bmi);
                });
                if(isMale)
                {
                  Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Result(text:bmi,gender:isMale)),
            );}
                if(isMale==false)
                {
                  Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Result(text:bmi,gender: isMale,)),
            );
                }
              },
              child: Text('Calculate',
              style: TextStyle(
                color: Colors.white,
              ),
              ),
            )
         ],
       ),
    );
  }
}


class Result extends StatefulWidget {
  final double text;
  final bool gender;
Result({Key key, @required this.text, this.gender}) : super(key: key);
  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  List<String> image=['underweight.PNG','underweightman.PNG','normal.PNG','normalman.PNG','overweight.PNG','overweightman.PNG','obese.PNG','obeseman.PNG','overobese.PNG','overobeseman.PNG'];
  int index=0;
  int index2=0;
   List<Color> colors = [Colors.blue,Colors.blue, Colors.green,  Colors.green, Colors.orange,Colors.orange,Colors.deepOrange,Colors.deepOrange,Colors.red,Colors.red];
  List<String> tips=[
'oo you are underweight ,you should eat healthy foods to maintain your health !!',
'kya baat hai bhai congrats gym vym jate ho kya ?',
'Your weight is little high , avoid eating junk food,',
'Your weight is too high with respect to your age and height',
'kya bhai? kitna khate ho thoda kam karo khana ',
'kya baat hai behn congrats ! gym vym jati ho kya ?',
'kya behn? kitna khati ho thoda kam karo khana '
  ];
  Future getVal()
  {
    if(widget.gender==false)
    {
                    if(widget.text>35)
                    setState(() {
                      index=8;
                      index2=6;
                    });
                    if(widget.text>30 && widget.text<34.99)
                    setState(() {
                      index=6;
                      index2=3;
                    });
                    if(widget.text>25 && widget.text<29.99)
                    setState(() {
                      index=4;
                      index2=2;
                    });
                    if(widget.text>18.5 &&widget.text<24.99)
                    setState(() {
                      index=2;
                      index2=5;
                    });
                    if(widget.text<18.8)
                    setState(() {
                      index=0;
                      index2=0;
                    });
    }
    else
    {               
                    if(widget.text>35)
                    setState(() {
                      index=9;
                      index2=4;
                    });
                    if(widget.text>30 && widget.text<34.99)
                    setState(() {
                      index=7;
                      index2=3;
                    });
                    if(widget.text>25 && widget.text<29.99)
                    setState(() {
                      index=5;
                      index2=2;
                    });
                    if(widget.text>18.5 &&widget.text<24.99)
                    setState(() {
                      index=3;
                      index2=1;
                    });
                    if(widget.text<18.8)
                    setState(() {
                      index=1;
                      index2=0;
                    });

    }
    print(tips[index2]);
  }
  @override
  Widget build(BuildContext context) {
    getVal();
    return Scaffold(
      appBar: AppBar(
        title: Text('Results'),
        backgroundColor: Colors.pink,
        // title: Text(widget.text.toString()),
      ),
      body:Center(
        child: Container(
           child: Column(children: <Widget>[
             SizedBox(height: 30,),
             Image.asset('assets/${image[index]}'),
             SizedBox(height: 20,),
             Text('Your BMI is ${widget.text.toStringAsFixed(1)}',
             style: TextStyle(
               color: colors[index],
               fontSize: 20,
             ),
             ),
             Padding(
               padding: const EdgeInsets.fromLTRB(40,10,40,10),
               child: Text(tips[index2],
               style: TextStyle(
                 color: colors[index],
                 fontSize: 20,
               ),
               ),
             )
           ],),
           ),
      ), 
            
    );
  }
}