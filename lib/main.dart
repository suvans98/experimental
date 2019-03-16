import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Timepass',
      debugShowCheckedModeBanner: false,
      home: TimePass(),
    );
  }
}

class TimePass extends StatefulWidget
{
  @override
  _TimePassState createState() => _TimePassState();
}

class _TimePassState extends State<TimePass> {
  final myController = TextEditingController();
  Color color = Colors.redAccent;
  String str = '0';
  void increment() {
    setState(() {
      var count =int.parse(str);
      count++;
      str = count.toString();
    });
  }

  void decrement() {
    setState(() {
      var count =int.parse(str);
      count--;
      str = count.toString();
    });
  }

  void changeColor() {
    setState(() {
      if (color == Colors.amberAccent)
        color = Colors.redAccent;
      else
        color = Colors.amberAccent;
    });
  }

  void printText()
  {
    setState(() {
      str=myController.text;
    });
  }
  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Test App',
      home: Scaffold(
        body: Container(
            color: color,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '$str',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  new RaisedButton(
                    onPressed: changeColor,
                    padding: EdgeInsets.all(8.0),
                    child: Text('Press To Change Colour'),
                    textColor: Colors.white,
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      new RaisedButton(
                        onPressed: decrement,
                        padding: EdgeInsets.all(8.0),
                        child: Text('-1'),
                        textColor: Colors.white,
                      ),
                      new RaisedButton(
                        onPressed: increment,
                        padding: EdgeInsets.all(8.0),
                        child: Text('+1'),
                        textColor: Colors.white,
                      ),
                    ],
                  ),
                  new TextField(

                    keyboardType: TextInputType.number,
                    controller: myController,
                    decoration: new InputDecoration(
                      hintText: 'Enter Starting Value for Counter',
                    ),
                  ),
                  
                  RaisedButton(

                    onPressed: () {
                     printText();
                    },
                    child: Text('Submit'),
                  )
                ],
              ),
            )),
            
      ),
    );
  }
}
