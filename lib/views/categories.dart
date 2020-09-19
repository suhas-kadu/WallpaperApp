import 'dart:convert';

import 'package:Wallpaper/data/data.dart';
import 'package:Wallpaper/model/wallpaper_model.dart';
import 'package:Wallpaper/widgets.dart/widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Categories extends StatefulWidget {
  final String CategorieName;
  Categories({this.CategorieName});

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<WallpaperModel> wallpapers = new List();
  getSearchWallpapers(String query) async {
    var url =
        "https://api.pexels.com/v1/search?query=$query&per_page=14&page=1";
    var response = await http.get(url, headers: {"Authorization": apiKey});
    //print(response.body.toString());

    Map<String, dynamic> jsonData = jsonDecode(response.body);
    jsonData["photos"].forEach((element) {
      //print(element);
      WallpaperModel wallpaperModel = new WallpaperModel();
      wallpaperModel = WallpaperModel.fromMap(element);
      wallpapers.add(wallpaperModel);
    });
    setState(() {});
  }

  @override
  void initState() {
    getSearchWallpapers(widget.CategorieName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: brandName(),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        //controller: controller,
        child: Column(
          children: <Widget>[
            wallpapersList(wallpapers: wallpapers,context: context),
            
          ],
        )
      ), 
    );
  }
}
