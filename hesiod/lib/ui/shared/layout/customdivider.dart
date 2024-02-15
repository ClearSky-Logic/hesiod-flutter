import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  final double? thickness;
  final double? height;
  final double? indent;
  final double? endIndent;
  final Color? color;

  const CustomDivider({
    super.key,
    this.thickness = 1.0,
    this.height = 1.0,
    this.indent = 0.0,
    this.endIndent = 0.0,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      indent: 0.0,
      endIndent: 0.0,
      height: height,
      thickness: thickness,
      color: color ?? Theme.of(context).dividerColor,
    );
  }
}
