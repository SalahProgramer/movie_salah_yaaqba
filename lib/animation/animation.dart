import 'package:flutter/cupertino.dart';

class Animations extends PageRouteBuilder {
  final dynamic page;
  final Offset? offsetBegin;

  Animations({this.page, this.offsetBegin})
    : super(
        pageBuilder: (context, animation2, animationTwo) => page,
        transitionDuration: const Duration(milliseconds: 500),
        reverseTransitionDuration: const Duration(milliseconds: 500),
        transitionsBuilder: (context, animation1, animationTwo, child) {
          // var begin = ;

          var begin = offsetBegin ?? const Offset(-1, 0);
          var end = const Offset(0, 0);

          var tween = Tween(begin: begin, end: end);
          var curveAnimation = CurvedAnimation(
            parent: animation1,
            curve: Curves.ease,
            reverseCurve: Curves.ease,
          );
          return SlideTransition(
            position: tween.animate(curveAnimation),
            child: child,
          );
        },
      );
}
