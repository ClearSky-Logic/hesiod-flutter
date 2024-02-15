import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hesiod/domain/enums/theme/text_state.dart';
import 'package:hesiod/ui/shared/theme/colour_palette.dart';
import 'package:hesiod/ui/shared/theme/text.dart';
import 'package:url_launcher/url_launcher.dart';

class WarningErrorWidget extends StatelessWidget {
  final String title;
  final String content;
  final String? url;
  final String? urlText;
  const WarningErrorWidget(
      {required this.title,
      required this.content,
      this.url,
      this.urlText,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Flex(direction: Axis.vertical, children: [
      SizedBox(
        child: Material(
            shape: const UnderlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                borderSide: BorderSide(color: AppColours.error, width: 3.0)),
            color: Colors.red[50],
            child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: AppText.subtitleBold(title,
                              state: TextState.error)),
                      if (url == null) ...[
                        AppText.messageMultiline(content,
                            state: TextState.error)
                      ] else ...[
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                            text: content,
                            style: const TextStyle(color: AppColours.error),
                          ),
                          if (url != null && urlText != null) ...[
                            TextSpan(
                                text: urlText,
                                style: const TextStyle(
                                    fontWeight: FontWeight.normal,
                                    decoration: TextDecoration.underline,
                                    color: AppColours.error),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => launchUrl(Uri.parse(url!)))
                          ]
                        ]))
                      ]
                    ]))),
      )
    ]);
  }
}
