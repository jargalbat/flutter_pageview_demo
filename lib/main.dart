import 'package:flutter/material.dart';
import 'package:flutter_pageview_demo/custom_page_view/ui/custom_page_view.dart';
import 'package:flutter_pageview_demo/intro_route.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: IntroRoute(),
    );
  }
}

