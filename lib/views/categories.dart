import 'dart:convert';

import 'package:Wallpaper/data/data.dart';
import 'package:Wallpaper/model/wallpaper_model.dart';
import 'package:Wallpaper/widgets.dart/widget.dart';
import 'package:flutter/cupertino.dart';
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
  getSearchWallpapers() async {
    var url =
        "https://api.pexels.com/v1/search?query=${widget.CategorieName}&per_page=30&page=2";
    var response = await http.get(url, headers: {"Authorization": apiKey}).then((response) {
      
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
    getSearchWallpapers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: brandName(),
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black
        ) ,
      ),
      body: SingleChildScrollView(
        //controller: controller,
        child: Column(
          children: <Widget>[
            wallpapersList(wallpapers: wallpapers,context: context),
            SizedBox(height: 15,)
            
          ],
        )
      ), 
    );
  }
}
