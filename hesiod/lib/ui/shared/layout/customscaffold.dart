import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hesiod/domain/constants/assetsconstants.dart';
import 'package:hesiod/domain/constants/routes.dart';
import 'package:hesiod/helpers/devicetype.dart';
import 'package:hesiod/ui/shared/theme/colour_palette.dart';
import 'package:hesiod/ui/shared/theme/text.dart';

class CustomScaffold extends StatelessWidget {
  final String title;
  final bool isTeamTips;
  final Widget body;
  final FloatingActionButton? floatingActionButton;
  final bool isStepper;

  const CustomScaffold(
      {super.key,
      required this.body,
      this.floatingActionButton,
      this.title = '',
      this.isTeamTips = false,
      this.isStepper = false});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      final bool isPhone = DeviceType().isPhone(constraints);
      return Stack(
        children: [
          Scaffold(
              backgroundColor:
                  isTeamTips ? AppColours.teamBackground : AppColours.surface,
              appBar: AppBar(
                leading: !isPhone
                    ? null
                    : IconButton(
                        icon: Icon(
                          Icons.adaptive.arrow_back,
                          color: AppColours.surfaceVariant,
                        ),
                        onPressed: () => context.pop(),
                      ),
                backgroundColor:
                    isTeamTips ? AppColours.teamBackground : AppColours.surface,
                elevation: 0.0,
                title: AppText.title(title),
                centerTitle: true,
              ),
              floatingActionButton: floatingActionButton,
              body: body),
          if (!isPhone && !isTeamTips && !isStepper) ...[
            // Positioned(
            //   right: 30.0,
            //   top: 30.0,
            //   child: SvgPicture.asset(AssetsConstants.logo,
            //       fit: BoxFit.contain, height: 18),
            // ),
          ],
        ],
      );
    });
  }
}
