import 'package:flutter/material.dart';
import 'package:hesiod/ui/shared/theme/colour_palette.dart';
import 'package:hesiod/ui/shared/theme/text.dart';

class Footer extends StatelessWidget {
  final BoxConstraints constraints;
  const Footer(this.constraints, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: constraints.maxWidth,
        height: 300,
        color: AppColours.darkTribeBlue,
        child: AppText.title("footer"));
  }
}
