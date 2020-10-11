import 'package:Wallpaper/model/wallpaper_model.dart';
import 'package:Wallpaper/views/image_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';
//import 'package:url_launcher/url_launcher.dart';

Widget brandName() {
  /*
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Text("Wallpaper",style: GoogleFonts.roboto(color: Colors.blue )),
      Text("App",style: GoogleFonts.roboto(color: Colors.black )),
    ],
  );*/

  return  Container(
    //margin: EdgeInsets.only(top: 25,),
    child: RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
              text: 'Wallpaper',
              style: GoogleFonts.roboto(fontWeight: FontWeight.w500, fontSize: 20, color: Colors.black)),
          TextSpan(
              text: 'App',
              style: GoogleFonts.roboto(fontWeight: FontWeight.w500, fontSize: 20, color: Colors.blue)),
        ],
      ),
    ),
  );

}

Widget wallpapersList({List<WallpaperModel> wallpapers, context}) {
  return Container(
    child: GridView.count(
        padding: EdgeInsets.only(top: 10, left: 10, right: 10),
        crossAxisCount: 2,
        childAspectRatio: 0.55,
        mainAxisSpacing: 6,
        crossAxisSpacing: 6,
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        children: wallpapers.map((wallpaper) {
          return GridTile(
            child: InkWell(
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
                        child: Container(
                          child: CachedNetworkImage(
                            imageUrl: wallpaper.src.portrait,
                            fit: BoxFit.cover,
                            placeholder: (context , url) => Center(child: CircularProgressIndicator()),
                            //progressIndicatorBuilder: CircularProgressIndicator(),
                          ),
                        )
                    ),
                ),
              ),
            ),
          );
        }).toList()),
  );
}


/*
Image.network(
wallpaper.src.portrait,
fit: BoxFit.cover,
),
*/

/*
* Image(image: CachedNetworkImageProvider(wallpaper.src.portrait), fit: BoxFit.cover, )
*/