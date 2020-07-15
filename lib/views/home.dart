import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gallery/data/data.dart';
import 'package:gallery/model/category_model.dart';
import 'package:gallery/widgets/appBar.dart';
import 'package:http/http.dart' as http;
import 'package:gallery/data/apikey.dart';


class Home extends StatefulWidget {


  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<CategoryModel> categories = new List();


  getTrendingWallpaper(){
    var response = http.get("https://api.pexels.com/v1/curated?per_page=1", headers: {
      'Authorization': apiKey
    });
  }
  @override
  void initState() {
    categories = getCategories();
    super.initState();
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
            Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(20),

              ),
              padding: EdgeInsets.only(left: 10, right: 10),
              margin: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search Wallpaper',
                        border: InputBorder.none
                      ),
                    ),
                  ),
                  Icon(Icons.search)
                ],
              ),
            ),
//            SizedBox(
//              height: 2,
//            ),
            Container(
              height: 60,
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 10),
                shrinkWrap: true,
              itemCount: categories.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index){
                return CategoriTile(
                      title: categories[index].categoryName,
                      imgURL: categories[index].imgURL,
                );
                  }
              ),
            )
          ],
        ),
      ),
    );
  }
}
class CategoriTile extends StatelessWidget {
  final String imgURL;
  final String title;

  const CategoriTile({Key key, @required this.imgURL,@required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 6),
      child: Stack(
        children: <Widget>[
          ClipRRect(
              child: Image.network(
                imgURL,
                height: 60,
                width: 100,
                fit: BoxFit.cover,
              ),
            borderRadius: BorderRadius.circular(16),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.black26,
            ),

            height: 60, width: 100,
            alignment: Alignment.center,
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white
              ),
            ),
          )
        ],
      ),
    );
  }
}
