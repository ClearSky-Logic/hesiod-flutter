import 'package:flutter/material.dart';
import 'package:hesiod/ui/shared/theme/colour_palette.dart';

class RoundFlatButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final Color color;
  final Color backgroundColor;
  final double height;
  final double width;
  final bool isInverted;
  final bool? isElevated;
  final bool? isDesctructive;

  const RoundFlatButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.color = AppColours.surface,
      this.backgroundColor = AppColours.comeAroundSundown,
      this.height = 48.0,
      this.width = double.infinity,
      this.isInverted = false,
      this.isElevated = true,
      this.isDesctructive = false});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
          onPressed: onPressed,
          style: onPressed == null
              ? ButtonStyle(
                  elevation: MaterialStateProperty.all<double>(0.0),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24.0),
                          side: BorderSide.none)),
                  backgroundColor: MaterialStateProperty.all(
                    AppColours.inactive,
                  ))
              : ButtonStyle(
                  elevation: MaterialStateProperty.all<double>(0.0),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24.0),
                          side: isInverted
                              ? const BorderSide(color: AppColours.secondary)
                              : BorderSide.none)),
                  backgroundColor: MaterialStateProperty.all(
                    isInverted ? AppColours.primary : backgroundColor,
                  )),
          child: Text(text,
              style: TextStyle(
                  fontFamily: 'Sofia',
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  letterSpacing: 1.25,
                  color: onPressed == null
                      ? AppColours.disabled
                      : isInverted
                          ? AppColours.secondary
                          : isDesctructive!
                              ? AppColours.error
                              : color))),
    );
  }
}
