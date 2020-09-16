import 'package:flutter/material.dart';
import 'routes/Routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      initialRoute: '/',
      onGenerateRoute: onGenerateRoute,
      // debugShowCheckedModeBanner: false, //显示debug 标签
    );
  }
}
