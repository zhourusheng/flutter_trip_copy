import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SpeakPage extends StatefulWidget {
  @override
  _SpeakPageState createState() => _SpeakPageState();
}

class _SpeakPageState extends State<SpeakPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('speak'),
      ),
    );
  }
}