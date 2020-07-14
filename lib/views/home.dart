import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gallery/widgets/appBar.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xff145C9E),
        title: AppName(),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                    ),
                  ),
                ),
                Icon(Icons.search)
              ],
            )
          ],
        ),
      ),
    );
  }
}
