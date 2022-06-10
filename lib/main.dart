import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'home.dart';
import 'suits.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.pink,
    statusBarBrightness: Brightness.dark,
  ));
  runApp(const MyApp());
  addSuitsP1();
  deckListShuffleP1();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'High Low Card Game',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const HomePage(title: 'High Low Card Game'),
      debugShowCheckedModeBanner: false,
      color: Colors.pink,
      //scrollBehavior: MyCustomScrollBehavior(),
    );
  }
}
