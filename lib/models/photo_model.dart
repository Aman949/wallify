class PhotoModel {
  String ?url;
  SrcModel? src;
  PhotoModel({this.url,  this.src});

  factory PhotoModel.fromMap(Map<String, dynamic> parsedJson){
   return PhotoModel(
    url: parsedJson["url"],
    src: SrcModel.fromMap(parsedJson["src"])
   );
  }
}

class SrcModel{
  String? portrait;
  String? large;
  String? landscape;
  String? medium;
  SrcModel({this.landscape,this.large,this.medium,this.portrait});
  factory SrcModel.fromMap(Map<String, dynamic> srcJson){
    return SrcModel(
      portrait: srcJson["portrait"],
      large: srcJson["large"],
      landscape: srcJson["landscape"],
      medium: srcJson["medium"]
    );
  }
}