import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gallery/data/apikey.dart';
import 'package:gallery/model/wallpaperModel.dart';
import 'package:gallery/widgets/appBar.dart';
import 'package:http/http.dart' as http;

class Search extends StatefulWidget {
  final String searchQuery;

  Search({this.searchQuery});

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<WallpaperModel> wallpaper = new List();
  TextEditingController searchController = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  getSearchedWallpaper(String query) async{
    var response = await http.get("https://api.pexels.com/v1/search?query=$query&per_page=100", headers: {
      'Authorization': apiKey
    });
//    print(response.body.toString());
    Map<String, dynamic> jsonData = jsonDecode(response.body);
    jsonData['photos'].forEach((element){
      print(element);
      WallpaperModel wallpaperModel = new WallpaperModel();
      wallpaperModel = WallpaperModel.fromMap(element);

      wallpaper.add(wallpaperModel);
    });
    setState(() {

    });
  }


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
            Expanded(
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                    hintText: 'Search Wallpaper', border: InputBorder.none),
              ),
            ),
            InkWell(
                onTap: () {

                },
                child: Container(child: Icon(Icons.search)))
          ],
        ),
      ),
    );
  }
}
