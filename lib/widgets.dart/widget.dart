import 'package:Wallpaper/model/wallpaper_model.dart';
import 'package:Wallpaper/views/image_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget brandName() {
  return  RichText(
    text: TextSpan(
      children: <TextSpan>[
        TextSpan(
            text: 'Wallpaper',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20)),
      ],
    ),
    
  );
  
}

Widget wallpapersList({List<WallpaperModel> wallpapers, context}) {
  return Container(
    child: GridView.count(
        padding: EdgeInsets.only(top: 20, left: 10, right: 10),
        crossAxisCount: 2,
        childAspectRatio: 0.55,
        mainAxisSpacing: 6,
        crossAxisSpacing: 6,
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        children: wallpapers.map((wallpaper) {
          return GridTile(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ImageView(
                              imgUrl: wallpaper.src.portrait,
                            )));
              },
              child: Hero(
                tag: wallpaper.src.portrait,
                child: Container(
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.network(
                          wallpaper.src.portrait,
                          fit: BoxFit.cover,
                        ))),
              ),
            ),
          );
        }).toList()),
  );
}
