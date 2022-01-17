import 'package:flutter/material.dart';

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
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Multi Page Application Page-1"),
      ),
      body: new Text("Another Page...!!!!!!"),
    );
  }
}
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _exercise = 100;

  void exercise() {
    setState(() {
      if (_exercise == 0) {
        _exercise = 100;
      }
      _exercise--;
    });
  }

  void _incrementCounter() {
    setState(() {

      if (_counter == 100) {
        _counter = 0;
      }
      _counter++;
    });
    exercise();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Funder- Creating Difference'),
          ),
          body: Center(child: Column(children: <Widget>[
            Container(
              margin: EdgeInsets.all(25),
              child: FlatButton(
                child: Text('SignUp', style: TextStyle(fontSize: 20.0),),
                onPressed: () {},
              ),
            ),

            Container(
              margin: EdgeInsets.all(25),
              child: FlatButton(
                child: Text('LogIn', style: TextStyle(fontSize: 20.0),),
                color: Colors.blueAccent,
                textColor: Colors.white,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => new SecondScreen()),
                    );
                  }
              ),
            ),
            Container(
              margin:EdgeInsets.all(25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: <Widget>[
                  const Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    '$_counter\n$_exercise',
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
