import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_jjd/bean/home_bean_entity.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dio/dio.dart';
import 'package:flutter_jjd/config/Config.dart';
import 'package:flutter_jjd/bean/good_list_bean_entity.dart';

/// 首页
class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List _focusData = [];
  List _hotProductList = [];
  List _bestProductList = [];

  @override
  void initState() {
    super.initState();
    _getFocusData();
    _getHotProductData();
    _getBestProductData();
  }

  /// 轮播图数据
  _getFocusData() async {
    var api = '${Config.domain}api/focus';
    var result = await Dio().get(api);
    var focusList = HomeBeanEntity.fromJson(result.data);
    setState(() {
      this._focusData = focusList.result;
    });
  }

  /// 获取猜你喜欢的数据
  _getHotProductData() async {
    var api = '${Config.domain}api/plist?is_hot=1';
    var result = await Dio().get(api);
    var hotGoodList = GoodListBeanEntity.fromJson(result.data);
    print(hotGoodList.result.toString());
    setState(() {
      this._hotProductList = hotGoodList.result;
    });
  }

  _getBestProductData() async {
    var api = '${Config.domain}api/plist?is_best=1';
    var result = await Dio().get(api);
    var bestProductList = GoodListBeanEntity.fromJson(result.data);
    print(bestProductList.result);
    setState(() {
      this._bestProductList = bestProductList.result;
    });
  }

  /// 轮播图
  Widget _swiperWidget() {
    return Container(
      child: AspectRatio(
        aspectRatio: 2 / 1,
        child: Swiper(
          itemCount: _focusData.length,
          itemBuilder: (context, index) {
            print(this._focusData[index].toString());
            String pic = this._focusData[index].pic;
            pic = Config.domain + pic.replaceAll('\\', '/');
            return new Image.network(pic, fit: BoxFit.fill);
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
    if (this._hotProductList.length > 0) {
      return Container(
        height: ScreenUtil().setHeight(234),
        padding: EdgeInsets.all(ScreenUtil().setWidth(20)),
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              //处理图片
              String sPic = this._hotProductList[index].pic;
              sPic = Config.domain+sPic.replaceAll("\\", "/");
              return Column(
                children: <Widget>[
                  Container(
                    height: ScreenUtil().setHeight(140),
                    width: ScreenUtil().setWidth(140),
                    margin: EdgeInsets.only(right: ScreenUtil().setWidth(20)),
                    child: Image.network(
                      sPic,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: ScreenUtil().setHeight(10)),
                    height: ScreenUtil().setHeight(50),
                    child: Text("￥${this._hotProductList[index].price}",
                        style: TextStyle(color: Colors.red)),
                  )
                ],
              );
            },
            itemCount: this._hotProductList.length),
      );
    } else {
      return Text("没有数据");
    }
  }

  /// 热门推荐
  Widget _recProductItemWidget() {
    var itemWith = (ScreenUtil.screenWidth - 30) / 2;
    return Container(
      padding: EdgeInsets.all(10),
      child: Wrap(
        runSpacing: 10,
        spacing: 10,
        children: this._bestProductList.map((value) {
          //图片
          String sPic = value.pic;
          sPic = Config.domain+sPic.replaceAll("\\", "/");

          print(sPic);
          return Container(
            padding: EdgeInsets.all(10),
            width: itemWith,
            decoration: BoxDecoration(
                border: Border.all(
                    color: Color.fromRGBO(233, 233, 233, 0.9), width: 1)),
            child: Column(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  child: AspectRatio(
                    aspectRatio: 1 / 1,
                    child: Image.network(
                      sPic,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
                  child: Text(
                    "${value.title}",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.black45),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
                  child: Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "￥${value.price.toString()}",
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: ScreenUtil().setSp(28)),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "￥${value.oldPrice}",
                          style: TextStyle(
                            color: Colors.black45,
                            fontSize: ScreenUtil().setSp(24),
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        }).toList(),
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
        this._titleWidget("热门推荐"),
        this._recProductItemWidget()
      ],
    );
  }
}
