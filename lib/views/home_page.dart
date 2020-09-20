import 'dart:convert';

import 'package:Wallpaper/data/data.dart';
import 'package:Wallpaper/model/categories_model.dart';
import 'package:Wallpaper/model/wallpaper_model.dart';
import 'package:Wallpaper/views/categories.dart';
import 'package:Wallpaper/views/image_view.dart';
import 'package:Wallpaper/views/search.dart';
import 'package:Wallpaper/widgets.dart/widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoriesModel> categories = new List();

  List<WallpaperModel> wallpapers = new List();

  TextEditingController searchController = new TextEditingController();

  ScrollController _scrollController = new ScrollController();

  int noOfImageToLoad = 30;
  int page = 1;

  getTrendingWallpapers() async {
    var url =
        "https://api.pexels.com/v1/curated?per_page=$noOfImageToLoad&page=4";
    //   https://api.pexels.com/v1/curated?per_page=$noOfImageToLoad&page=$page
     await http
        .get(url, headers: {"Authorization": apiKey}).then((response) {
          
    Map<String, dynamic> jsonData = jsonDecode(response.body);
    jsonData["photos"].forEach((element) {
      //print(element);
      WallpaperModel wallpaperModel = new WallpaperModel();
      wallpaperModel = WallpaperModel.fromMap(element);
      wallpapers.add(wallpaperModel);
        });


      //print(response.body.toString());
    });
    setState(() {});
  }

  @override
  void initState() {
    //Calling the items in categories list
    getTrendingWallpapers();
    categories = getCategories();
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        noOfImageToLoad = noOfImageToLoad + 30;
        getTrendingWallpapers();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: brandName(),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  //Color(0xfff5f8fd)
                  borderRadius: BorderRadius.circular(50),
                ),
                padding: EdgeInsets.symmetric(horizontal: 20),
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        controller: searchController,
                        decoration: InputDecoration(hintText: "search"),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Search(
                                      searchQuery: searchController.text,
                                    )));
                      },
                      child: Container(
                        child: Icon(
                          Icons.search,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                height: 50,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  itemCount: categories.length,
                  physics: ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return CategoriesTile(
                      title: categories[index].categoriesName,
                      imgUrl: categories[index].imgUrl,
                    );
                  },
                ),
              ),
              wallpapersList(wallpapers: wallpapers, context: context),
              SizedBox(height: 15,),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoriesTile extends StatelessWidget {
  final String imgUrl;
  final String title;
  CategoriesTile({this.imgUrl, this.title});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Categories(
                      CategorieName: title.toLowerCase(),
                    )));
      },
      child: Container(
        height: 60,
        width: 100,
        margin: EdgeInsets.only(right: 5),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                imgUrl,
                height: 50,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                color: Colors.black26,
                height: 50,
                width: 100,
                alignment: Alignment.center,
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
