import 'package:flutter/material.dart';
import 'package:hesiod/domain/constants/assetsconstants.dart';

import 'dart:math' as math;

import 'package:hesiod/ui/shared/theme/colour_palette.dart';

class CustomProgressIndicator extends StatefulWidget {
  const CustomProgressIndicator({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomProgressIndicator> createState() =>
      _CustomProgressIndicatorState();
}

class _CustomProgressIndicatorState extends State<CustomProgressIndicator>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  double percent = 0.0;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..animateTo(1.0)
          ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: AppColours.surface,
      child: Center(
        child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) => Transform.rotate(
                    angle: _controller.value * 2 * math.pi,
                    child: const FlutterLogo()))),
      ),
    );
  }
}
