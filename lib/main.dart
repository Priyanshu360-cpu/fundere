import 'package:flutter/material.dart';
import 'dart:async';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Fundere - Creating Differences'),

    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class SecondScreen extends StatelessWidget {
  @override
  Widget build (BuildContext ctxt) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Multi Page Application Page-1"),
      ),
      body: const Text("Another Page...!!!!!!"),
    );
  }
}
class SignupPage extends StatelessWidget{
  @override
  Widget build (BuildContext ctxt){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home page"),
      ),
          body: const Text("Hewo"),
    );
  }
}
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _exercise = 100;
 int _timer = 0;

  void exercise() {
    setState(() {
      if (_exercise == 0) {
        _exercise = 100;
      }
      _exercise--;
    });
  }

void _timed(){
  void doStuffCallback(){
    setState((){
      _timer++;
    });
    var timer = new Timer(const Duration(milliseconds: 10), doStuffCallback);
    timer;
    if(_timer==100){
      timer.cancel();
    }
  }
}
  void _incrementCounter() {
    setState(() {

      if (_counter == 100) {
        _counter = 0;
      }
      _counter++;
    });
    exercise();
    _timed();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Funder- Creating Difference'),
          ),
          body: Center(child: Column(children: <Widget>[

            Container(

              margin: const EdgeInsets.all(25),
              child: TextButton(
                child: const Text('SignUp', style: TextStyle(fontSize: 20.0),),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  SignupPage()),
                    );
                    setState(() {
                      _counter=0;
                      _exercise=100;
                    });
                  }
              ),

            ),

            Container(
              margin: const EdgeInsets.all(25),
              child: FlatButton(
                child: const Text('LogIn', style: TextStyle(fontSize: 20.0),),
                color: Colors.blueAccent,
                textColor: Colors.white,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  SecondScreen()),
                    );
                    setState(() {
                    _counter=0;
                    _exercise=100;
                  });
                        }
              ),
            ),
            Container(
              margin:const EdgeInsets.all(25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: <Widget>[
                  const Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    'Time done - $_counter\nTime Left - $_exercise\nTimer - $_timer',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              ),

            ),

          ]
          )),
        floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter ,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      ),
    );
  }
}
