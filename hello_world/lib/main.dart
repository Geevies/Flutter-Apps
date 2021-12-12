import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Testing',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const MyHomePage(title: 'Counter Fun'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _clickTime = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
      _clickTime = DateTime.now().millisecondsSinceEpoch;
    });
  }

  // initState() runs the first time you open a page
  // the Timer.periodic calls setState, which rebuilds the page
  // this gives the click timer a cool effect
  // note: needs full rebuild to test, hot update does not redo initState
  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(milliseconds: 15), (_) => setState(() {}));
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
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            const SizedBox(height: 50),
            const Text(
              'You pushed this button this many milliseconds ago:',
            ),
            Text(
              '${_clickTime > 0 ? DateTime.now().millisecondsSinceEpoch - _clickTime : "You haven't clicked yet!"}',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
