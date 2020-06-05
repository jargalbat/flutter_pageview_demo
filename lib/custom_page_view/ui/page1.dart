import 'package:flutter/material.dart';
import 'package:flutter_pageview_demo/custom_page_view/provider/offset_notifier.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

class Page1 extends StatelessWidget {
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
              Center(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: Container(),
                    ),
                  ),
                ),
              ),

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

              Consumer<OffsetNotifier>(
                builder: (context, notifier, child) {
                  return Transform.rotate(
                    angle: math.max(0, (math.pi / 2) * 4 * notifier.page),
                    child: Opacity(
                      opacity: math.max(0, math.max(0, 1 - notifier.page)),
                      child: child,
                    ),
                  );
                },
                child: Container(
                  child: Icon(Icons.home, size: 150),
                ),
              ),

              Consumer<OffsetNotifier>(
                builder: (context, notifier, child) {
                  print(math.max(0, 0 - notifier.page));
                  var offset = notifier.page;
                  double gauss = math.exp(-(math.pow((offset.abs() - 0.5), 2) / 0.08));

                  return Transform.translate(
//                    offset: Offset(math.max(0, math.max(0, 1 - notifier.page)), 0),
//                    offset: Offset(math.max(0, 1 * notifier.page).toDouble(), math.max(0, 1 * notifier.page).toDouble()),
                    offset: Offset(-32 * gauss * offset.sign, 0),

                    child: Opacity(
                      opacity: math.max(0, math.max(0, 1 - notifier.page)),
                      child: child,
                    ),
                  );
                },
                child: Container(
                  child: Icon(Icons.home, size: 150),
                ),
              ),

//              Consumer<OffsetNotifier>(
//                builder: (context, notifier, child) {
//                  print(math.max(0, 0 - notifier.page));
//                  return Transform(
//                    alignment: Alignment.center,
//                    transform: Matrix4.identity()..setEntry(3, 2, 0.001)
//                      ..rotateX(1 + notifier.page),
//                    child: Container(
//                      child: Icon(Icons.home, size: 150),
//                    ),
//                  );
//                },
////                child: Container(
////                  child: Icon(Icons.home, size: 150),
////                ),
//              ),
            ],
          ),
        )
      ],
    );
  }
}
