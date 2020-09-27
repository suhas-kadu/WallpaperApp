class WallpaperModel {
  String photographer;
  String photographerUrl;
  int photographerId;
  SrcModel src;

  WallpaperModel(
      {this.photographer, this.photographerUrl, this.photographerId, this.src});

  factory WallpaperModel.fromMap(Map<String, dynamic> jsonData) {
    return WallpaperModel(
      photographer: jsonData["photographer"],
      photographerId: jsonData["photographerId"],
      photographerUrl: jsonData["photographerUrl"],
      src: SrcModel.fromMap(jsonData["src"]),
    );
  }
}

class SrcModel {
  String original;
  String small;
  String landscape;
  String portrait;

  SrcModel({this.original, this.small, this.landscape, this.portrait});

  factory SrcModel.fromMap(Map<String, dynamic> jsonData) {
    return SrcModel(
      original: jsonData["original"],
      small: jsonData["small"],
      portrait: jsonData["portrait"],
      landscape: jsonData["landscape"],
    );
  }
}
