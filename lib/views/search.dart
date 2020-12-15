import 'dart:convert';

import 'package:Wallpaper/model/wallpaper_model.dart';
import 'package:Wallpaper/widgets.dart/widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:Wallpaper/data/data.dart';

class Search extends StatefulWidget {
  final String searchQuery;

  Search({this.searchQuery});

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<WallpaperModel> wallpapers = new List();
  TextEditingController searchController = new TextEditingController();

  getSearchWallpapers(String query) async {
    var url =
        "https://api.pexels.com/v1/search?query=$query&per_page=30&page=1";
    var response = await http.get(url, headers: {"Authorization": apiKey}).then((response) {

      Map<String, dynamic> jsonData = jsonDecode(response.body);
    jsonData["photos"].forEach((element) {
      //print(element);
      WallpaperModel wallpaperModel = new WallpaperModel();
      wallpaperModel = WallpaperModel.fromMap(element);
      wallpapers.add(wallpaperModel);
    });
    //print(response.body.toString());

    setState(() {});    
    });
    
  }

  @override
  void initState() {
    
    getSearchWallpapers(widget.searchQuery);
    searchController.text = widget.searchQuery;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: brandName(),
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.black87,
        ),
        ),
      body: SingleChildScrollView(
          child: Container(
            child: Column(
      children: <Widget>[
        Container(
          
          decoration: BoxDecoration(
            color: Colors.grey[100],
            //Color(0xfff5f8fd),
              borderRadius: BorderRadius.circular(50),
              border: Border.all(color: Colors.grey.withOpacity(0.1)),

            //borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.symmetric(horizontal: 20, ),
          margin: EdgeInsets.only(left: 10,right: 10,top: 10,),
          child: Row(
            children: <Widget>[
              Expanded(
                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(hintText: "search",border: InputBorder.none),
                ),
              ),
              InkWell(
                onTap: () {
                  getSearchWallpapers(searchController.text);
                },
                child: Container(child: Icon(Icons.search,),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        wallpapersList(wallpapers: wallpapers, context: context),
        SizedBox(height: 15,)
      ],
            ),
          ),
        ),
    );
  }
}
