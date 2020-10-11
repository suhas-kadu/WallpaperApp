import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';


class InfoScreen extends StatefulWidget {
  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {

  _launchUrl(String url) async {
if(await canLaunch(url)) {
await launch(url);
}else{
  throw "Could not launch $url";
}


  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Made by "),
                InkWell(
                  onTap: () {
                    _launchUrl("https://www.linkedin.com/in/suhas-kadu-12b1a51ab/");
                  },
                  child: Text(" Suhas Kadu",
                  style: GoogleFonts.roboto(color: Colors.blue,),
                  ),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Powered by "),
                InkWell(
                  onTap: () {
                    _launchUrl("https://www.pexels.com/");
                  },
                  child: Text(" Pexels",
                  style: GoogleFonts.roboto(color: Colors.blue,),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
