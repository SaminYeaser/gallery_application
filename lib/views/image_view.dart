import 'package:flutter/material.dart';

class ImageViewerPage extends StatefulWidget {
  final String imageUrl;
  ImageViewerPage({@required this.imageUrl});
  @override
  _ImageViewerPageState createState() => _ImageViewerPageState();
}

class _ImageViewerPageState extends State<ImageViewerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Hero(
            tag: widget.imageUrl,
            child: Container(
              height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Image.network(widget.imageUrl, fit: BoxFit.cover,)
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0x36FFFFFF),
                        Color(0x0FFFFFFF)
                      ]
                    )
                  ),
                  child: Column(
                   children: <Widget>[
                     Text('Download')
                   ],
                  ),
                ),
                Text('Cancel',
                style: TextStyle(
                  color: Colors.white
                ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
