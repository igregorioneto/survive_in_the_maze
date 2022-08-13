import 'package:flutter/material.dart';
import 'package:survive_in_the_maze/starter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Survivor In The Maze',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Starter(),
      debugShowCheckedModeBanner: false,
    );
  }
}
