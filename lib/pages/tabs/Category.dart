import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_jjd/config/Config.dart';
import 'package:dio/dio.dart';
import 'package:flutter_jjd/bean/cate_bean.dart';

/// 分类
class CategoryPage extends StatefulWidget {
  CategoryPage({Key key}) : super(key: key);

  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  int _selectIndex = 0;
  List _leftCateList = [];
  List _rightCateList = [];

  @override
  void initState() {
    super.initState();
    _getLeftCateData();
  }

  ///左侧分类
  _getLeftCateData() async {
    var api = '${Config.domain}api/pcate';
    var result = await Dio().get(api);
    var leftCateList = new CateBean.fromJson(result.data);
    // print(leftCateList.result);
    setState(() {
      this._leftCateList = leftCateList.result;
    });
    _getRightCateData(leftCateList.result[0].pid);
  }

  //右侧分类
  _getRightCateData(pid) async {
    var api = '${Config.domain}api/pcate?pid=${pid}';
    var result = await Dio().get(api);
    var rightCateList = new CateBean.fromJson(result.data);
    // print(rightCateList.result);
    setState(() {
      this._rightCateList = rightCateList.result;
    });
  }

  Widget _leftCateWidget(leftWidth) {
    if (this._leftCateList.length > 0) {
      return Container(
        height: double.infinity,
        width: leftWidth,
        child: ListView.builder(
            itemCount: _leftCateList.length,
            itemBuilder: (context, index) {
              return Column(
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      setState(() {
                        this._selectIndex = index;
                        this._getRightCateData(this._leftCateList[index].pid);
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      padding: EdgeInsets.only(top: ScreenUtil().setHeight(24)),
                      height: ScreenUtil().setHeight(84),
                      child: Text("${this._leftCateList[index].title}",
                          textAlign: TextAlign.center),
                      color: _selectIndex == index
                          ? Color.fromRGBO(240, 246, 246, 0.9)
                          : Colors.white,
                    ),
                  ),
                  Divider(
                    height: 1,
                  )
                ],
              );
            }),
      );
    } else {
      return Container(width: leftWidth, height: double.infinity);
    }
  }

  Widget _rightCateWidget(rightItemWidth, rightItemHeight) {
    return Expanded(
        flex: 1,
        child: Container(
            padding: EdgeInsets.all(10),
            height: double.infinity,
            color: Color.fromRGBO(240, 246, 246, 0.9),
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.all(10),
              child: GridView.builder(
                  itemCount: _rightCateList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: rightItemWidth / rightItemHeight,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10),
                  itemBuilder: (context, index) {
                    //处理图片
                    String pic = this._rightCateList[index].pic;
                    pic = Config.domain + pic.replaceAll('\\', '/');
                    return Container(
                      child: Column(
                        children: <Widget>[
                          AspectRatio(
                            aspectRatio: 1 / 1,
                            child: Image.network(
                              pic,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 4),
                            height: ScreenUtil().setHeight(60),
                            child: Text("${this._rightCateList[index].title}"),
                          )
                        ],
                      ),
                    );
                  }),
            )));
  }

  @override
  Widget build(BuildContext context) {
    ///注意用ScreenAdaper必须得在build方法里面初始化
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: true);

    ///计算大小
    var leftWidth = ScreenUtil.screenWidth / 4;
    var rightItemWidth = (ScreenUtil.screenWidth - leftWidth - 20 - 20) / 3;
    rightItemWidth = ScreenUtil().setWidth(rightItemWidth);
    //
    var rightItemHeight = rightItemWidth + ScreenUtil().setHeight(36);

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        _leftCateWidget(leftWidth),
        _rightCateWidget(rightItemWidth, rightItemHeight)
      ],
    );
  }
}
