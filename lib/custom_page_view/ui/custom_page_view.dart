import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pageview_demo/custom_page_view/provider/index_notifier.dart';
import 'package:flutter_pageview_demo/custom_page_view/provider/offset_notifier.dart';
import 'package:flutter_pageview_demo/custom_page_view/ui/page2.dart';
import 'package:provider/provider.dart';

import 'page1.dart';

class CustomPageView extends StatefulWidget {
  @override
  _CustomPageViewState createState() => _CustomPageViewState();
}

class _CustomPageViewState extends State<CustomPageView> {
  PageController _pageController;

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    _pageController = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OffsetNotifier(_pageController),
      child: PageView(
        controller: _pageController,
        onPageChanged: (int index) {
          Provider.of<IndexNotifier>(context, listen: false).index = index;
        },
        children: <Widget>[
          Page1(),
          Page2(),
          Icon(Icons.shop, size: 100.0),
        ],
      ),
    );
  }
}
