//import 'dart:ui';
import 'dart:typed_data';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
//import 'package:url_launcher/url_launcher.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
//import 'package:random_string/random_string.dart';
import 'package:dio/dio.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:google_fonts/google_fonts.dart';

class ImageView extends StatefulWidget {
  final String imgUrl;

  ImageView({@required this.imgUrl});

  @override
  _ImageViewState createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  var filePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Hero(
            tag: widget.imgUrl,
            child: Container(
                //Height of mobile display
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: CachedNetworkImage(
                  imageUrl: widget.imgUrl,
                  fit: BoxFit.cover,
                  //placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                  //color: Color(0xfff5f8fd),
                  //progressIndicatorBuilder: CircularProgressIndicator(context ),
                ),
                ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
                //border: Border.all(color: Colors.white70)
                ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    _save();
                  },
                  child: Stack(children: <Widget>[
                    Container(
                        //height: 50,
                        width: MediaQuery.of(context).size.width - 20,
                        //padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                        //width : 300
                        decoration: BoxDecoration(
                          //border: Border.all(color: Colors.white60, width: 1),
                          borderRadius: BorderRadius.circular(30),
                        )),
                    Container(
                      //height: 50,
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width - 20,
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                      //width : 300
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white60.withOpacity(0.4), width: 1),
                          borderRadius: BorderRadius.circular(30),
                          gradient: LinearGradient(colors: [
                            Colors.black26,
                            Colors.black38,
                            Colors.black26,
                          ],
                          )
                          ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Set Wallpaper",
                            style:
                                GoogleFonts.roboto(color: Colors.white70, fontSize: 16,),
                          ),
                          Text(
                            "Image will be saved in Gallery",
                            style:
                                GoogleFonts.roboto(color: Colors.white70, fontSize: 12),
                          )
                        ],
                      ),
                    ),
                  ]),
                ),
                SizedBox(
                  height: 15,
                ),
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                        child: Text(
                      "Cancel",
                      style: GoogleFonts.roboto(color: Colors.white,fontSize: 16,),
                    
                    ))),
                SizedBox(
                  height: 30,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  _save() async {
    await _askPermission();
    var response = await Dio().get(widget.imgUrl,
        options: Options(responseType: ResponseType.bytes));
    final result =
        await ImageGallerySaver.saveImage(Uint8List.fromList(response.data));
    print(result);
    Navigator.pop(context);
  }

  _askPermission() async {
    if (Platform.isIOS) {
      Map<PermissionGroup, PermissionStatus> permissions =
          await PermissionHandler()
              .requestPermissions([PermissionGroup.photos]);
    } else {
     PermissionStatus permission = await PermissionHandler()
          .checkPermissionStatus(PermissionGroup.storage);
    }
  }
  
}
