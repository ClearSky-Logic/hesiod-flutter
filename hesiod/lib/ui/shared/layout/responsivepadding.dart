import 'package:flutter/material.dart';
import 'package:hesiod/helpers/devicetype.dart';

class ResponsivePadding extends StatelessWidget {
  final Widget child;
  final double? top;
  final double? bottom;
  final double? left;
  final double? right;
  final bool? isNotFullscreen;

  const ResponsivePadding(
      {required this.child,
      this.top = 12.0,
      this.bottom = 12.0,
      this.left = 12.0,
      this.right = 12.0,
      this.isNotFullscreen = false,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      bool isPhone = DeviceType().isPhone(constraints);
      double fullScreenSidePadding =
          (MediaQuery.of(context).size.width - 600) / 2;
      double sidePadding = MediaQuery.of(context).size.width * 0.13;
      double heightPadding = (MediaQuery.of(context).size.height) * 0.1;
      return Padding(
        padding: isPhone
            ? EdgeInsets.only(
                top: top!, bottom: bottom!, left: left!, right: right!)
            : EdgeInsets.only(
                left: isNotFullscreen! ? sidePadding : fullScreenSidePadding,
                right: isNotFullscreen! ? sidePadding : fullScreenSidePadding,
                top: heightPadding,
                bottom: 60),
        child: child,
      );
    });
  }
}
