import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Random random = Random();

  late int _roleOne;
  late int _roleTwo;
  late int _roleThree;

  String _dialogGame = "A vous de jouer";

  List<Widget> listImage = [
    Image.asset(
      'images/bar.png',
      width: 100,
      height: 100,
      fit: BoxFit.contain,
    ),
    Image.asset(
      'images/cerise.png',
      width: 100,
      height: 100,
      fit: BoxFit.contain,
    ),
    Image.asset(
      'images/cloche.png',
      width: 100,
      height: 100,
      fit: BoxFit.contain,
    ),
    Image.asset(
      'images/diamant.png',
      width: 100,
      height: 100,
      fit: BoxFit.contain,
    ),
    Image.asset(
      'images/fer-a-cheval.png',
      width: 100,
      height: 100,
      fit: BoxFit.contain,
    ),
    Image.asset(
      'images/pasteque.png',
      width: 100,
      height: 100,
      fit: BoxFit.contain,
    ),
    Image.asset(
      'images/sept.png',
      width: 100,
      height: 100,
      fit: BoxFit.contain,
    ),
  ];


  @override
  void initState() {
    super.initState();
    _roleOne = random.nextInt(6);
    _roleTwo = random.nextInt(6);
    _roleThree = random.nextInt(6);
  }

  void _incrementCounter() {
    setState(() {
      _roleOne = random.nextInt(6);
      _roleTwo = random.nextInt(6);
      _roleThree = random.nextInt(6);

      if (_roleOne == _roleTwo &&
          _roleTwo == _roleThree &&
          _roleOne == _roleThree) {
        _dialogGame = 'Jackpot';
      } else {
        _dialogGame = 'You loose... Try Again !';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$_dialogGame',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                listImage[_roleOne],
                listImage[_roleTwo],
                listImage[_roleThree],
                // Image.asset(
                //   'images/bar.png',
                //   width: 100,
                //   height: 100,
                //   fit: BoxFit.contain,
                // ),
                // Image.asset(
                //   'images/bar.png',
                //   width: 100,
                //   height: 100,
                //   fit: BoxFit.contain,
                // ),
                // Image.asset(
                //   'images/bar.png',
                //   width: 100,
                //   height: 100,
                //   fit: BoxFit.contain,
                // )
              ],
            )
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
