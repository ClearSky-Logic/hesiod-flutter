import 'package:flutter/material.dart';
import 'package:hesiod/ui/shared/theme/colour_palette.dart';

class FlatSurfaceButton extends StatelessWidget {
  final String text;
  final IconData? icon;
  final void Function()? onPressed;
  final double height;
  final double width;
  final double elevation;

  const FlatSurfaceButton(this.text, this.icon, this.onPressed,
      {super.key,
      this.height = 60.0,
      this.width = double.infinity,
      this.elevation = 0.0});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
            onPressed: onPressed,
            style: ButtonStyle(
                elevation: MaterialStateProperty.all(elevation),
                shadowColor: MaterialStateProperty.all(AppColours.primary),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                )),
                padding: MaterialStateProperty.all(const EdgeInsets.all(8.0)),
                backgroundColor:
                    MaterialStateProperty.all(AppColours.background),
                // ignore: body_might_complete_normally_nullable
                overlayColor:
                    MaterialStateProperty.resolveWith<Color?>((states) {
                  if (states.contains(MaterialState.pressed)) {
                    return AppColours.secondary;
                  }
                  return null;
                })),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 16.0),
                  child: Icon(icon, color: AppColours.primary, size: 26.0),
                ),
                Text(text,
                    style: const TextStyle(
                        fontFamily: 'Sofia',
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                        color: AppColours.primary)),
              ],
            )),
      ),
    );
  }
}
