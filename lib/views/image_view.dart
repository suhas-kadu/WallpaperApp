import 'package:flutter/material.dart';

class ImageView extends StatefulWidget {
  final String imgUrl;
  ImageView({this.imgUrl});
  @override
  _ImageViewState createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
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
              child: Image.network(widget.imgUrl,fit: BoxFit.cover,)),
          ),
        Container(
          height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
            //border: Border.all(color: Colors.white70)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                //height: 50,
                width: MediaQuery.of(context).size.width/2,
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                //width : 300
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white60, width: 1),
                  borderRadius: BorderRadius.circular(30),
                  gradient: LinearGradient(colors:[ Colors.black26,Colors.black38,Colors.black26])
                ),
                child: Column(
                  children: <Widget>[
                    Text("Set Wallpaper",style: TextStyle(color: Colors.white70, fontSize: 16),),
                    Text("Image will be saved in Gallery",style: TextStyle(color: Colors.white70, fontSize: 10),)
                  ],
                ),

              ),
              SizedBox(height: 10,),
              Text("Cancel",style: TextStyle(color: Colors.white),),
              SizedBox(
                height: 20,
              )
            ],
          ),
        )
        
        
        ],
      ),
    );
  }
}
