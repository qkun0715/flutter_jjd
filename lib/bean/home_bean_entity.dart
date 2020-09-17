/// result : [{"_id":"59f6ef443ce1fb0fb02c7a43","title":"笔记本电脑","status":"1","pic":"public\\upload\\UObZahqPYzFvx_C9CQjU8KiX.png","url":"12"},{"_id":"5a012efb93ec4d199c18d1b4","title":"第二个轮播图","status":"1","pic":"public\\upload\\f3OtH11ZaPX5AA4Ov95Q7DEM.png"},{"_id":"5a012f2433574208841e0820","title":"第三个轮播图","status":"1","pic":"public\\upload\\s5ujmYBQVRcLuvBHvWFMJHzS.jpg"},{"_id":"5a688a0ca6dcba0ff4861a3d","title":"教程","status":"1","pic":"public\\upload\\Zh8EP9HOasV28ynDSp8TaGwd.png"}]

class HomeBeanEntity {
  List<Result> _result;

  List<Result> get result => _result;

  HomeBeanEntity({
      List<Result> result}){
    _result = result;
}

  HomeBeanEntity.fromJson(dynamic json) {
    if (json["result"] != null) {
      _result = [];
      json["result"].forEach((v) {
        _result.add(Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_result != null) {
      map["result"] = _result.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// _id : "59f6ef443ce1fb0fb02c7a43"
/// title : "笔记本电脑"
/// status : "1"
/// pic : "public\\upload\\UObZahqPYzFvx_C9CQjU8KiX.png"
/// url : "12"

class Result {
  String _id;
  String _title;
  String _status;
  String _pic;
  String _url;

  String get id => _id;
  String get title => _title;
  String get status => _status;
  String get pic => _pic;
  String get url => _url;

  Result({
      String id, 
      String title, 
      String status, 
      String pic, 
      String url}){
    _id = id;
    _title = title;
    _status = status;
    _pic = pic;
    _url = url;
}

  Result.fromJson(dynamic json) {
    _id = json["Id"];
    _title = json["title"];
    _status = json["status"];
    _pic = json["pic"];
    _url = json["url"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["Id"] = _id;
    map["title"] = _title;
    map["status"] = _status;
    map["pic"] = _pic;
    map["url"] = _url;
    return map;
  }

}