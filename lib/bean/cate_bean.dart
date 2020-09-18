/// result : [{"_id":"59f1e1ada1da8b15d42234e9","title":"电脑办公","status":"1","pic":"public\\upload\\FNIJ1lUH1bfuK82mbpIszetN.jpg","pid":"0","sort":"100"},{"_id":"59f1e1e880e7ed050cec999d","title":"女装内衣","status":1,"pic":"public\\upload\\-F3lLH3nMqAt2kmZEEYjWoMB","pid":"0","sort":"100"},{"_id":"59f1e4659bfd8f3bd030eed3","title":"运动户外","status":1,"pic":"public\\upload\\30TyxuLsWPqfl2Yxui85EYWn","pid":"0","sort":"100"},{"_id":"59f1e46e9bfd8f3bd030eed4","title":"手机数码","status":"1","pic":"public\\upload\\xHxjQsbq-QuTXdblQXkuCXui","pid":"0","sort":"100"},{"_id":"59f1e47e9bfd8f3bd030eed5","title":"化妆品","status":"1","pic":"public\\upload\\1TfHsgvvKrFuIH1D4_eo3P5B","pid":"0","sort":"100"},{"_id":"5a04251e010e711234661438","title":"箱包","status":"1","pic":"public\\upload\\L12eQlmsqPJXS_346iVwXy7T","pid":"0","sort":"100"},{"_id":"5a04261e010e71123466143a","title":"女鞋","status":1,"pic":"public\\upload\\FyaoJ3ffL8h26oNd4qKandkA","pid":"0","sort":"100"},{"_id":"5a042e29010e711234661443","title":"汽车用品","status":"1","pic":"public\\upload\\IBRQbWEDMlK82LvFkLQguLkM","pid":"0","sort":"100"},{"_id":"5a042f27010e711234661446","title":"酒水饮料","status":"1","pic":"public\\upload\\_FtRBEpVMf42LzO_eOYszwAA","pid":"0","sort":"100"}]

class CateBean {
  List<Result> _result;

  List<Result> get result => _result;

  CateBean({
      List<Result> result}){
    _result = result;
}

  CateBean.fromJson(dynamic json) {
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

/// _id : "59f1e1ada1da8b15d42234e9"
/// title : "电脑办公"
/// status : "1"
/// pic : "public\\upload\\FNIJ1lUH1bfuK82mbpIszetN.jpg"
/// pid : "0"
/// sort : "100"

class Result {
  String _id;
  String _title;
  Object _status;
  String _pic;
  String _pid;
  String _sort;

  String get id => _id;
  String get title => _title;
  String get status => _status;
  String get pic => _pic;
  String get pid => _pid;
  String get sort => _sort;

  Result({
      String id, 
      String title, 
      Object status,
      String pic, 
      String pid, 
      String sort}){
    _id = id;
    _title = title;
    _status = status;
    _pic = pic;
    _pid = pid;
    _sort = sort;
}

  Result.fromJson(dynamic json) {
    _id = json["Id"];
    _title = json["title"];
    _status = json["status"];
    _pic = json["pic"];
    _pid = json["pid"];
    _sort = json["sort"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["Id"] = _id;
    map["title"] = _title;
    map["status"] = _status;
    map["pic"] = _pic;
    map["pid"] = _pid;
    map["sort"] = _sort;
    return map;
  }

}