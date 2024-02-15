import 'package:flutter/material.dart';
import 'package:hesiod/helpers/devicetype.dart';
import 'package:hesiod/ui/shared/layout/bottomrightlogo.dart';

class LayoutBuilderWithLogo extends StatelessWidget {
  final Widget child;

  const LayoutBuilderWithLogo({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      bool isPhone = DeviceType().isPhone(constraints);
      return Stack(children: [
        child,
        if (!isPhone) ...[const BottomRightLogo()]
      ]);
    });
  }
}
