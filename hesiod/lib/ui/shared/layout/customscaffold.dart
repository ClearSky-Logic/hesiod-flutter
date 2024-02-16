import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hesiod/domain/constants/assetsconstants.dart';
import 'package:hesiod/domain/constants/routes.dart';
import 'package:hesiod/domain/enums/theme/text_state.dart';
import 'package:hesiod/helpers/devicetype.dart';
import 'package:hesiod/ui/shared/theme/colour_palette.dart';
import 'package:hesiod/ui/shared/theme/text.dart';

class CustomScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  final FloatingActionButton? floatingActionButton;
  final bool isStepper;

  const CustomScaffold(
      {super.key,
      required this.body,
      this.floatingActionButton,
      this.title = '',
      this.isStepper = false});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      final bool isPhone = DeviceType().isPhone(constraints);
      return Scaffold(
        backgroundColor: AppColours.surface,
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
          backgroundColor: AppColours.darkTribeBlue,
          elevation: 0.0,
          title: AppText.title(title),
          centerTitle: true,
        ),
        floatingActionButton: floatingActionButton,
        body: Container(
          // height: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [AppColours.darkTribeBlue, AppColours.lightGrey],
                  stops: [0.2, 0.2])),

          //pass right body and under body, see exalidraw
          child: body,
        ),
      );
    });
  }

  Widget _navigation(BuildContext context, BoxConstraints constraints) {
    return Container(
        width: DeviceType().getClampedWidth(constraints) / 5.5,
        height: 500,
        decoration: const BoxDecoration(
          color: Colors.white,
          // color: AppColours.primary,
          borderRadius: BorderRadius.all(
            Radius.circular(12.0),
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const FlutterLogo(),
                  AppText.title("Brand Logo"),
                ],
              ),
            ),
            navLink(Icons.bar_chart_rounded, "Investment Performance",
                selected: true),
            navLink(Icons.signpost_rounded, "Letting Dashboard"),
            navLink(Icons.message, "Messages"),
            navLink(Icons.shopping_bag, "Asset Management Request"),
            navLink(Icons.account_circle_rounded, "Investor Profile"),
            navLink(Icons.logout_rounded, "Logout"),
          ],
        ));
  }

  Widget navLink(IconData icon, String title, {bool selected = false}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: selected ? AppColours.comeAroundSundown : null,
            borderRadius: BorderRadius.circular(10.0)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 4.0),
                child: Icon(icon, color: selected ? Colors.white : null),
              ),
              AppText.subtitle(title,
                  state:
                      selected ? TextState.onDarkBackground : TextState.normal),
            ],
          ),
        ),
      ),
    );
  }
}
