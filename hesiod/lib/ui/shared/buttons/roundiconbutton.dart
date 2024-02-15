import 'package:flutter/material.dart';
import 'package:hesiod/ui/shared/theme/colour_palette.dart';

class RoundIconButton extends StatelessWidget {
  final IconData? icon;
  final void Function()? onPressed;

  const RoundIconButton(this.icon, this.onPressed, {super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
            shape: MaterialStateProperty.all(const CircleBorder()),
            padding: MaterialStateProperty.all(const EdgeInsets.all(8.0)),
            backgroundColor: MaterialStateProperty.all(AppColours.primary),
            // ignore: body_might_complete_normally_nullable
            overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
              if (states.contains(MaterialState.pressed)) {
                return AppColours.secondary;
              }
            })),
        child: Icon(icon));
  }
}
