import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hesiod/domain/constants/routes.dart';
import 'package:hesiod/domain/enums/theme/text_state.dart';
import 'package:hesiod/ui/shared/buttons/roundflatbutton.dart';
import 'package:hesiod/ui/shared/layout/main_logo_image.dart';
import 'package:hesiod/ui/shared/layout/responsivepadding.dart';
import 'package:hesiod/ui/shared/theme/colour_palette.dart';
import 'package:hesiod/ui/shared/theme/text.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.primary,
      body: ResponsivePadding(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const LogoImage(),
            Padding(
              padding: const EdgeInsets.only(top: 100.0, bottom: 100.0),
              child: AppText.title(
                  'Sorry, the page you are looking for does not exist.',
                  textAlign: TextAlign.center,
                  maxLines: 5,
                  state: TextState.onDarkBackground),
            ),
            RoundFlatButton(
                text: "Go Home",
                onPressed: () => context.canPop()
                    ? context.pop()
                    : context.goNamed(Routes.home.name))
          ],
        ),
      ),
    );
  }
}
