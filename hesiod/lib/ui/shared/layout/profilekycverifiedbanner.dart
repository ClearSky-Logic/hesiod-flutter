import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hesiod/domain/constants/assetsconstants.dart';
import 'package:hesiod/domain/constants/routes.dart';
import 'package:hesiod/domain/enums/theme/text_state.dart';
import 'package:hesiod/ui/shared/theme/colour_palette.dart';
import 'package:hesiod/ui/shared/theme/text.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileKycVerifiedBanner extends StatelessWidget {
  //final ProfileViewModel viewModel;
  final bool isDeletion;

  const ProfileKycVerifiedBanner({super.key, this.isDeletion = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
      child: Flex(direction: Axis.vertical, children: [
        Material(
            shape: const UnderlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                borderSide: BorderSide(color: AppColours.error, width: 3.0)),
            color: Colors.red[50],
            child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            if (!isDeletion) ...[
                              Padding(
                                  padding: const EdgeInsets.only(bottom: 12.0),
                                  child: AppText.subtitleBold(
                                      "Profile incomplete",
                                      state: TextState.error))
                            ],
                            AppText.messageMultiline(
                                isDeletion
                                    ? "Your request to delete your account has been received and is waiting to be processed."
                                    : !kIsWeb
                                        ? "Please complete your profile in order for URocked to pay your tips into your bank account."
                                        : "To complete your profile, we need to verify your identity. This action can only be completed using our mobile app. Please take a moment to download our mobile app and verify your identity.",
                                state: TextState.error)
                          ]),
                      if (!isDeletion) ...[
                        Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  if (kIsWeb) ...[
                                    GestureDetector(
                                      onTap: () => launchUrl(Uri.parse(
                                          "https://apps.apple.com/gb/app/urocked/id1589800711")),
                                      child: SvgPicture.asset(
                                          AssetsConstants.logo,
                                          width: 120),
                                    ),
                                    GestureDetector(
                                      onTap: () => launchUrl(Uri.parse(
                                          "https://play.google.com/store/apps/details?id=com.urocked.myaccount")),
                                      child: Image.asset(AssetsConstants.logo,
                                          width: 156),
                                    )
                                  ] else ...[
                                    RichText(
                                        textAlign: TextAlign.left,
                                        text: TextSpan(children: [
                                          TextSpan(
                                              text: "COMPLETE YOUR PROFILE",
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  color: AppColours.error,
                                                  fontFamily: 'Sofia',
                                                  fontWeight: FontWeight.w400),
                                              recognizer: TapGestureRecognizer()
                                                ..onTap = () => context.goNamed(
                                                      Routes.home.name,
                                                    ))
                                        ]))
                                  ]
                                ]))
                      ]
                    ])))
      ]),
    );
  }
}
