import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hesiod/domain/constants/assetsconstants.dart';

class BottomRightLogo extends StatelessWidget {
  const BottomRightLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Positioned(bottom: 30.0, right: 30.0, child: FlutterLogo());
  }
}
