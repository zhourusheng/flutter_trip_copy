import 'package:flutter/material.dart';
import 'navigator/tab_navigator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '携程App',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: TabNavigator(),
    );
  }
}