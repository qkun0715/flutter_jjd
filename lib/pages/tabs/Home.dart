import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 首页
class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /// 轮播图
  Widget _swiperWidget() {
    List<Map> imgList = [
      {"url": "https://www.itying.com/images/flutter/slide01.jpg"},
      {"url": "https://www.itying.com/images/flutter/slide02.jpg"},
      {"url": "https://www.itying.com/images/flutter/slide03.jpg"},
    ];
    return Container(
      child: AspectRatio(
        aspectRatio: 2 / 1,
        child: Swiper(
          itemCount: imgList.length,
          itemBuilder: (context, index) {
            return new Image.network(imgList[index]["url"], fit: BoxFit.fill);
          },
          pagination: new SwiperPagination(),
          autoplay: true,
        ),
      ),
    );
  }

  Widget _titleWidget(value) {
    return Container(
      height: 40.h,
      margin: EdgeInsets.only(left: 20.h),
      padding: EdgeInsets.only(left: 20.h),
      decoration: BoxDecoration(
          border: Border(left: BorderSide(color: Colors.red, width: 10.h))),
      child: Text(value, style: TextStyle(color: Colors.black45)),
    );
  }

  /// 热门商品
  Widget _hotProductListWidget() {
    return Container(
      height: ScreenUtil().setHeight(234),
      padding: EdgeInsets.all(ScreenUtil().setWidth(20)),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Column(
              children: <Widget>[
                Container(
                  height: ScreenUtil().setHeight(140),
                  width: ScreenUtil().setWidth(140),
                  margin: EdgeInsets.only(right: ScreenUtil().setWidth(20)),
                  child: Image.network(
                    "https://www.itying.com/images/flutter/hot${index + 1}.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: ScreenUtil().setHeight(10)),
                  height: ScreenUtil().setHeight(50),
                  child: Text("第${index}条"),
                )
              ],
            );
          },
          itemCount: 10),
    );
  }

  Widget _recProductItemWidget() {
    var itemWith = (ScreenUtil.screenWidth - 30) / 2;
    return Container(
      padding: EdgeInsets.all(10),
      width: itemWith,
      decoration: BoxDecoration(
          border:
              Border.all(color: Color.fromRGBO(233, 233, 233, 0.9), width: 1)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: AspectRatio(
              aspectRatio: 1 / 1,
              child: Image.network(
                "https://www.itying.com/images/flutter/list1.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
            child: Text(
              "2019夏季新款气质高贵洋气阔太太有女人味中长款宽松大码",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.black54),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20.h),
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "¥188.0",
                    style: TextStyle(
                        color: Colors.red, fontSize: ScreenUtil().setSp(28)),
                  ),
                ),
                Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "¥198.0",
                      style: TextStyle(
                        color: Colors.black45,
                        fontSize: ScreenUtil().setSp(24),
                        decoration: TextDecoration.lineThrough,
                      ),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: true);

    return ListView(
      children: <Widget>[
        this._swiperWidget(),
        SizedBox(height: 10.h),
        this._titleWidget("猜你喜欢"),
        SizedBox(height: 10.h),
        this._hotProductListWidget(),
        SizedBox(height: 10.h),
        _titleWidget("热门推荐"),
        Container(
          padding: EdgeInsets.all(10),
          child: Wrap(
            runSpacing: 10,
            spacing: 10,
            children: <Widget>[
              this._recProductItemWidget(),
              this._recProductItemWidget(),
              this._recProductItemWidget(),
              this._recProductItemWidget(),
              this._recProductItemWidget(),
              this._recProductItemWidget(),
              this._recProductItemWidget(),
              this._recProductItemWidget(),
              this._recProductItemWidget(),
              this._recProductItemWidget(),
              this._recProductItemWidget(),
              this._recProductItemWidget(),
              this._recProductItemWidget(),
              this._recProductItemWidget(),
              this._recProductItemWidget(),
              this._recProductItemWidget(),
              this._recProductItemWidget(),
              this._recProductItemWidget(),
              this._recProductItemWidget(),
              this._recProductItemWidget(),
            ],
          ),
        )
      ],
    );
  }
}
