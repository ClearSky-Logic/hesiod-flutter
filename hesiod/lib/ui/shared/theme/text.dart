import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hesiod/domain/enums/theme/text_state.dart';
import 'package:hesiod/ui/shared/theme/colour_palette.dart';
import 'package:url_launcher/url_launcher.dart';

class AppText {
  static const FontWeight _bold = FontWeight.w700;
  static const FontWeight _medium = FontWeight.w500;
  static const FontWeight _regular = FontWeight.w400;
  static const FontWeight _light = FontWeight.w300;

  static Text title(String content,
          {TextState state = TextState.normal,
          TextAlign textAlign = TextAlign.left,
          int maxLines = 1,
          overflow = TextOverflow.ellipsis}) =>
      _getText(content, _getTextStyle(_regular, _getColour(state), 24),
          textAlign, maxLines);

  static Text titleBold(
    String content, {
    TextState state = TextState.normal,
    TextAlign textAlign = TextAlign.left,
    int maxLines = 1,
    overflow = TextOverflow.ellipsis,
  }) =>
      _getText(content, _getTextStyle(_bold, _getColour(state), 24), textAlign,
          maxLines);

  static Text titleMultiline(String content,
          {TextState state = TextState.normal,
          TextAlign textAlign = TextAlign.left,
          int maxLines = 2,
          overflow = TextOverflow.ellipsis}) =>
      _getText(content, _getTextStyle(_regular, _getColour(state), 24),
          textAlign, maxLines);

  static Text titleHeadMultiline(String content,
          {TextState state = TextState.normal,
          TextAlign textAlign = TextAlign.left,
          int maxLines = 5,
          overflow = TextOverflow.ellipsis}) =>
      _getText(
          content,
          _getTextStyle(_regular, _getColour(state), 32, height: 1.0),
          textAlign,
          maxLines);

  static Text bigValue(String content,
          {TextState state = TextState.normal,
          TextAlign textAlign = TextAlign.left,
          int maxLines = 1}) =>
      _getText(content, _getTextStyle(_medium, _getColour(state), 34),
          textAlign, maxLines);

  static Text bigValueMultiline(String content,
          {TextState state = TextState.normal,
          TextAlign textAlign = TextAlign.left,
          int maxLines = 3}) =>
      _getText(
          content,
          _getTextStyle(_light, _getColour(state), 36, height: 1.0),
          textAlign,
          maxLines);

  static Text subtitle(String content,
          {TextState state = TextState.normal,
          TextAlign textAlign = TextAlign.left,
          FontWeight fontWeight = FontWeight.w300,
          int maxLines = 1}) =>
      _getText(content, _getTextStyle(fontWeight, _getColour(state), 16),
          textAlign, maxLines);

  static Text subtitleLighter(String content,
          {TextState state = TextState.normal,
          TextAlign textAlign = TextAlign.left,
          int maxLines = 1}) =>
      _getText(content, _getTextStyle(_light, _getColour(state), 16), textAlign,
          maxLines);

  static Text subtitleBold(String content,
          {TextState state = TextState.normal,
          TextAlign textAlign = TextAlign.left,
          int maxLines = 1}) =>
      _getText(content, _getTextStyle(_medium, _getColour(state), 16),
          textAlign, maxLines);

  static Text subtitleMultiline(String content,
          {TextState state = TextState.normal,
          TextAlign textAlign = TextAlign.left,
          int maxLines = 3}) =>
      _getText(content, _getTextStyle(_regular, _getColour(state), 16),
          textAlign, maxLines);

  static Text subtitleMultilineLighter(String content,
          {TextState state = TextState.normal,
          TextAlign textAlign = TextAlign.left,
          int maxLines = 3}) =>
      _getText(content, _getTextStyle(_light, _getColour(state), 16), textAlign,
          maxLines);

  static Text profileSubtitle(String content,
          {TextState state = TextState.normal,
          TextAlign textAlign = TextAlign.left,
          int maxLines = 1}) =>
      _getText(content, _getTextStyle(_regular, _getColour(state), 18),
          textAlign, maxLines);

  static Text profileName(String content,
          {TextState state = TextState.normal,
          TextAlign textAlign = TextAlign.left,
          int maxLines = 2}) =>
      _getText(content, _getTextStyle(_medium, _getColour(state), 20),
          textAlign, maxLines);

  static Text body(String content,
          {TextState state = TextState.normal,
          TextAlign textAlign = TextAlign.left,
          FontWeight fontWeight = FontWeight.w300,
          int maxLines = 1,
          bool tabularFigures = false}) =>
      _getText(
          content,
          _getTextStyle(fontWeight, _getColour(state), 16,
              tabularFigures: tabularFigures),
          textAlign,
          maxLines);

  static Text bodyList(String content,
          {TextState state = TextState.normal,
          TextAlign textAlign = TextAlign.left,
          FontWeight fontWeight = FontWeight.w300,
          int maxLines = 1}) =>
      _getText(content, _getTextStyle(fontWeight, _getColour(state), 10),
          textAlign, maxLines);

  static Text navBar(String content,
          {Color? colour,
          TextAlign textAlign = TextAlign.left,
          FontWeight fontWeight = FontWeight.w300,
          int maxLines = 1}) =>
      _getText(
          content, _getTextStyle(fontWeight, colour!, 12), textAlign, maxLines);

  static Text bodyMultiline(String content,
          {TextState state = TextState.normal,
          TextAlign textAlign = TextAlign.left,
          FontWeight fontWeight = FontWeight.w300,
          int maxLines = 100}) =>
      _getText(content, _getTextStyle(fontWeight, _getColour(state), 16),
          textAlign, maxLines);

  static Text message(String content,
          {TextState state = TextState.normal,
          TextAlign textAlign = TextAlign.left,
          FontWeight fontWeight = FontWeight.w300,
          int maxLines = 1}) =>
      _getText(content, _getTextStyle(fontWeight, _getColour(state), 14),
          textAlign, maxLines);

  static Text messageMultiline(String content,
          {TextState state = TextState.normal,
          TextAlign textAlign = TextAlign.left,
          int maxLines = 3}) =>
      _getText(content, _getTextStyle(_light, _getColour(state), 14), textAlign,
          maxLines);

  static RichText url(String content,
          {TextState state = TextState.link,
          TextAlign textAlign = TextAlign.left,
          int maxLines = 1}) =>
      _getUrl(content, _getTextStyle(_regular, _getColour(state), 14),
          textAlign, maxLines);

  static Text formHeader(String content,
          {TextState state = TextState.normal,
          TextAlign textAlign = TextAlign.left,
          int maxLines = 1}) =>
      _getText(content, _getTextStyle(_regular, _getColour(state), 14),
          textAlign, maxLines);

  static Color _getColour(TextState state) {
    // Get Text Colour
    switch (state) {
      case TextState.normal:
        return AppColours.surfaceVariant;
      case TextState.disabled:
        return AppColours.disabled;
      case TextState.error:
        return AppColours.error;
      case TextState.link:
        return AppColours.primary;
      case TextState.onDarkBackground:
        return AppColours.surface;
      case TextState.onDarkBackgroundAlt:
        return AppColours.secondary;
      case TextState.lighter:
        return AppColours.surfaceVariantLighter;
      case TextState.pending:
        return AppColours.secondary;
      case TextState.payable:
        return AppColours.payable;
      default:
        throw ArgumentError("AppText: Unknown TextState ($state)");
    }
  }

  static TextStyle _getTextStyle(
          FontWeight fontWeight, Color color, double size,
          {double? height, bool tabularFigures = false}) =>
      TextStyle(
          overflow: TextOverflow.ellipsis,
          height: height ?? 1.4,
          fontFamily: "Milano",
          color: color,
          fontSize: size,
          fontWeight: fontWeight,
          fontFeatures:
              tabularFigures ? [const FontFeature.tabularFigures()] : null);

  static Text _getText(String content, TextStyle textStyle, TextAlign textAlign,
          int maxLines) =>
      Text(
        content,
        style: textStyle,
        textAlign: textAlign,
        maxLines: maxLines,
      );
  static RichText _getUrl(String content, TextStyle textStyle,
          TextAlign textAlign, int maxLines) =>
      RichText(
        text: TextSpan(
          text: content,
          style: textStyle,
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              launchUrl(Uri.parse("tel:$content"));
            },
        ),
      );
}
