import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pageview_demo/custom_page_view/provider/index_notifier.dart';
import 'package:flutter_pageview_demo/custom_page_view/ui/custom_page_view.dart';
import 'package:provider/provider.dart';

class IntroRoute extends StatefulWidget {
  @override
  _IntroRouteState createState() => _IntroRouteState();
}

class _IntroRouteState extends State<IntroRoute> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(20.0, 16.0, 20.0, 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Hops",
                  style: TextStyle(
                    fontSize: 22.0,
                    fontFamily: "Graphik",
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Stack(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.shopping_cart),
                      onPressed: () {},
                    ),
                    Positioned(
                      right: 10,
                      bottom: 8,
                      child: Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: ChangeNotifierProvider(
              create: (context) => IndexNotifier(),
              child: CustomPageView(),
            ),
          )
        ],
      ),
    );
  }
}
