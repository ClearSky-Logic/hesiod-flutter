import 'package:flutter/material.dart';
import 'package:hesiod/helpers/devicetype.dart';
import 'package:hesiod/ui/shared/buttons/roundflatbutton.dart';
import 'package:hesiod/ui/shared/buttons/transparentbutton.dart';
import 'package:hesiod/ui/shared/theme/text.dart';

import '../theme/colour_palette.dart';

class ConfirmActionDialog extends StatelessWidget {
  final BuildContext context;
  final String title;
  final String message;
  final Function()? onConfirmPressed;
  final Function()? onCancelPressed;
  final String? positiveText;
  final String? negativeText;
  final Color confirmColor;
  final String? icon;
  final bool? isDestructive;

  const ConfirmActionDialog(this.context, this.title, this.message,
      {super.key,
      this.onConfirmPressed,
      this.onCancelPressed,
      this.positiveText = "Confirm",
      this.negativeText = "Back",
      this.confirmColor = AppColours.primary,
      this.icon = '',
      this.isDestructive = false});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      bool isPhone = DeviceType().isPhone(constraints);
      return Dialog(
        backgroundColor: AppColours.surface,
        insetPadding: const EdgeInsets.all(20),
        child: Container(
          width: isPhone
              ? MediaQuery.of(context).size.width * 0.9
              : DeviceType().getClampedWidth(constraints),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  if (icon != '')
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundImage: AssetImage(
                              icon!,
                            ),
                            backgroundColor: Colors.transparent,
                          ),
                        ],
                      ),
                    )
                  else
                    const Padding(padding: EdgeInsets.all(12.0)),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: AppText.subtitleMultiline(title),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: AppText.message(message, maxLines: 10),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: RoundFlatButton(
                            isDesctructive: isDestructive,
                            isElevated: isDestructive! ? false : true,
                            backgroundColor: confirmColor,
                            color: AppColours.surface,
                            text: positiveText!,
                            onPressed: () async {
                              await onConfirmPressed!();
                            },
                          ),
                        ),
                        TransparentButton(
                          text: negativeText!,
                          onPressed: () async {
                            await onCancelPressed!();
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
