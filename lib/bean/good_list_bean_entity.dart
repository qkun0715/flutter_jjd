/// result : [{"_id":"5a012cba64604635f4a2eae0","title":"小米 红米5A 全网通版 2GB+16GB 香槟金","cid":"5a05031e010e71123466144d","price":599,"old_price":"599.00","pic":"public\\upload\\NkuiIr9puaI7cSxZHfz8UYOT.jpg","s_pic":"public\\upload\\NkuiIr9puaI7cSxZHfz8UYOT.jpg_200x200.jpg"},{"_id":"5a042b3b010e71123466143e","title":"卡姿兰（Carslan）蜗牛气垫调控霜礼盒装 ","cid":"59f1e47e9bfd8f3bd030eed5","price":198,"old_price":"198","pic":"public\\upload\\egpzY5yUU59OAIC_D_SDj0oz.png","s_pic":"public\\upload\\egpzY5yUU59OAIC_D_SDj0oz.png_200x200.png"},{"_id":"5a042c65010e711234661440","title":"暗影精灵III代 15.6英寸游戏笔记本电脑","cid":"59f1e4919bfd8f3bd030eed6","price":5999,"old_price":"8999","pic":"public\\upload\\wqdy5XSwZJ8Wkp1FNFM6LGk5.png","s_pic":"public\\upload\\wqdy5XSwZJ8Wkp1FNFM6LGk5.png_200x200.png"},{"_id":"5a042d30010e711234661441","title":"女士尼龙双肩背包 ","cid":"5a04251e010e711234661438","price":3000,"old_price":"3000","pic":"public\\upload\\O7zzbbXDDZH-RTiQ5WlJHBFn.png","s_pic":"public\\upload\\O7zzbbXDDZH-RTiQ5WlJHBFn.png_200x200.png"},{"_id":"5a042ea7010e711234661444","title":"费雪（Fisher Price） 多功能早教启智玩具 声光狮子手推车学步车","cid":"5a042e29010e711234661443","price":88,"old_price":"188","pic":"public\\upload\\KqOpb7U4Exk-K3OmNweMkTNS.png","s_pic":"public\\upload\\KqOpb7U4Exk-K3OmNweMkTNS.png_200x200.png"},{"_id":"5a042eff010e711234661445","title":"澳贝（AUBY） 益智玩具 乖乖小鸭 运动爬行婴幼儿童早教启智声光玩具","cid":"5a042e29010e711234661443","price":88,"old_price":"108","pic":"public\\upload\\ouJ2Ko8Y3fzaVBqhNp284ntA.png","s_pic":"public\\upload\\ouJ2Ko8Y3fzaVBqhNp284ntA.png_200x200.png"},{"_id":"5a07eeeaad8b300e28e2feb5","title":"机械革命(MECHREVO)深海泰坦X6Ti-S(黑曜金)15.6英寸游戏笔记本","cid":"59f1e4919bfd8f3bd030eed6","price":5799,"old_price":"5899","pic":"public\\upload\\bYm5SiQ0tUcNlWzksm8XsO73.jpg","s_pic":"public\\upload\\bYm5SiQ0tUcNlWzksm8XsO73.jpg_200x200.jpg"},{"_id":"5a07efc3ad8b300e28e2feba","title":"微星(MSI)GL62VR 7RFX-848CN 15.6英寸游戏本","cid":"59f1e4919bfd8f3bd030eed6","price":6456,"old_price":"7456","pic":"public\\upload\\_mqz5JqsZEjnrh7Qui3KfOOO.jpg","s_pic":"public\\upload\\_mqz5JqsZEjnrh7Qui3KfOOO.jpg_200x200.jpg"},{"_id":"5a07efe9ad8b300e28e2febb","title":"戴尔DELL灵越游匣Master15-R4645R 15.6英寸游戏笔记本电脑","cid":"59f1e4919bfd8f3bd030eed6","price":5677,"old_price":"6778","pic":"public\\upload\\YUv6N37Lriv7QK7WePQmyz-u.jpg","s_pic":"public\\upload\\YUv6N37Lriv7QK7WePQmyz-u.jpg_200x200.jpg"},{"_id":"5a080b4ead8b300e28e2feca","title":"荣耀8 4GB+64GB 全网通4G手机","cid":"59f1e4919bfd8f3bd030eed6","price":1600,"old_price":"1700","pic":"public\\upload\\_5BY2tJyuKXIkmOxaKAXIXUt.jpg","s_pic":"public\\upload\\_5BY2tJyuKXIkmOxaKAXIXUt.jpg_200x200.jpg"}]

class GoodListBeanEntity {
  List<Result> _result;

  List<Result> get result => _result;

  GoodListBeanEntity({
      List<Result> result}){
    _result = result;
}

  GoodListBeanEntity.fromJson(dynamic json) {
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

/// _id : "5a012cba64604635f4a2eae0"
/// title : "小米 红米5A 全网通版 2GB+16GB 香槟金"
/// cid : "5a05031e010e71123466144d"
/// price : 599
/// old_price : "599.00"
/// pic : "public\\upload\\NkuiIr9puaI7cSxZHfz8UYOT.jpg"
/// s_pic : "public\\upload\\NkuiIr9puaI7cSxZHfz8UYOT.jpg_200x200.jpg"

class Result {
  String _id;
  String _title;
  String _cid;
  Object _price;
  String _oldPrice;
  String _pic;
  String _sPic;

  String get id => _id;
  String get title => _title;
  String get cid => _cid;
  Object get price => _price;
  String get oldPrice => _oldPrice;
  String get pic => _pic;
  String get sPic => _sPic;

  Result({
      String id, 
      String title, 
      String cid,
    Object price,
      String oldPrice, 
      String pic, 
      String sPic}){
    _id = id;
    _title = title;
    _cid = cid;
    _price = price;
    _oldPrice = oldPrice;
    _pic = pic;
    _sPic = sPic;
}

  Result.fromJson(dynamic json) {
    _id = json["Id"];
    _title = json["title"];
    _cid = json["cid"];
    _price = json["price"];
    _oldPrice = json["oldPrice"];
    _pic = json["pic"];
    _sPic = json["sPic"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["Id"] = _id;
    map["title"] = _title;
    map["cid"] = _cid;
    map["price"] = _price;
    map["oldPrice"] = _oldPrice;
    map["pic"] = _pic;
    map["sPic"] = _sPic;
    return map;
  }

}