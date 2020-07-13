import 'package:flutter/material.dart';
import 'package:gallery/widgets/widgets.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff145C9E),
        title: AppName(),
      ),
    );
  }
}
