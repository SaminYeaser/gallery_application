import 'dart:io';

class WallpaperModel {
  String photographer;
  String photographer_url;
  int photographer_id;
  SrcModel src;

  WallpaperModel( {
    this.photographer,
    this.photographer_id,
    this.photographer_url,
    this.src

  });
  factory WallpaperModel.fromMap(Map<String, dynamic> jsonData){
    return WallpaperModel(
      src: jsonData['src'],
      photographer_url: jsonData['photographer_url'],
      photographer_id: jsonData['photographer_id'],
      photographer: jsonData['photographer']
    );
  }
}

class SrcModel {
  String orginal;
  String small;
  String portrait;

  SrcModel({
    this.orginal,
    this.small,
    this.portrait,
  });
  factory SrcModel.fromMap(Map<String, dynamic> jsonData){
    return SrcModel(
      portrait: jsonData['portrait'],
      orginal: jsonData['original'],
      small: jsonData['small']
    );
  }
}
