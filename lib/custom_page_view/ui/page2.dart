import 'package:flutter/material.dart';
import 'package:flutter_pageview_demo/custom_page_view/provider/offset_notifier.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          width: double.infinity,
          height: 500,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Consumer<OffsetNotifier>(
                builder: (context, notifier, child) {
                  return Transform.scale(
                    scale: math.max(0, 1 - notifier.page),
                    child: Opacity(
                      opacity: math.max(0, math.max(0, 1 - notifier.page)),
                      child: child,
                    ),
                  );
                },
                child: Center(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 340,
                        height: 340,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                        ),
                        child: Container(),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
