import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hesiod/domain/constants/assetsconstants.dart';

class LogoImage extends StatelessWidget {
  final double widthScale;
  final double heightScale;
  const LogoImage({
    super.key,
    this.widthScale = 0.4,
    this.heightScale = 0.05,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: 20.0, left: 20.0, right: 20.0, bottom: 20.0),
      child: SizedBox(
          width: MediaQuery.of(context).size.width * widthScale,
          height: MediaQuery.of(context).size.height * heightScale,
          child: const FlutterLogo()),
    );
  }
}
