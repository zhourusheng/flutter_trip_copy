import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabNavigator extends StatefulWidget {
  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('home'),
      ),
    );
  }
}