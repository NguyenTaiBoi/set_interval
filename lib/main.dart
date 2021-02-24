import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _counterTimer = 100;

  void _setTimer() {
    Future.delayed(Duration(seconds: 5), () {
      setState(() {
        _counterTimer++;
      });
    });
  }

  void _setInterval(){
    Timer.periodic(new Duration(seconds: 1), (timer) {
      debugPrint(timer.tick.toString());
      setState(() {
        _counter = timer.tick;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Set Interval',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              'Set Timer',
            ),
            Text(
              '$_counterTimer',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: _setInterval,
            tooltip: 'setInterval',
            child: Icon(Icons.functions),
          ),
          FloatingActionButton(
            onPressed: _setTimer,
            tooltip: 'setTimer',
            child: Icon(Icons.timer),
          ),
        ],
      )
    );
  }
}
