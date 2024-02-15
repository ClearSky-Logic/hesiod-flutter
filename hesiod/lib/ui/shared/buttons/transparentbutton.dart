import 'package:flutter/material.dart';
import 'package:hesiod/ui/shared/theme/colour_palette.dart';

class TransparentButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final double height;
  final double width;
  final bool? isRejection;
  final bool? isBorderTransparent;

  const TransparentButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.height = 48.0,
      this.width = double.infinity,
      this.isRejection = false,
      this.isBorderTransparent = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextButton(
          onPressed: onPressed,
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.transparent),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.0),
                      side: BorderSide(
                          color: isRejection!
                              ? AppColours.error
                              : isBorderTransparent!
                                  ? Colors.transparent
                                  : AppColours.primary)))),
          child: Text(text,
              style: TextStyle(
                  fontFamily: 'Sofia',
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  letterSpacing: 1.25,
                  color:
                      isRejection! ? AppColours.error : AppColours.primary))),
    );
  }
}
