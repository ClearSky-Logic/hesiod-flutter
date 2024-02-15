import 'package:flutter/material.dart';
import 'package:hesiod/domain/enums/theme/text_state.dart';
import 'package:hesiod/ui/shared/theme/colour_palette.dart';

import '../theme/text.dart';

class ProfilePageItem extends StatelessWidget {
  final String text;
  final IconData? icon;
  final Function() onTap;

  const ProfilePageItem(this.text, this.icon, this.onTap, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: icon == null
                ? Container()
                : Icon(
                    icon,
                    size: 28,
                    color: AppColours.primary,
                  ),
          ),
          AppText.profileSubtitle(text, state: TextState.link)
        ],
      ),
    );
  }
}
