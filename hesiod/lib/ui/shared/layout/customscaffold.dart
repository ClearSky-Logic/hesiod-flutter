import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:hesiod/domain/enums/theme/text_state.dart';
import 'package:hesiod/helpers/devicetype.dart';
import 'package:hesiod/ui/shared/layout/topnavigation.dart';
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
        body:
            //pass right body and under body, see exalidraw
            SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [AppColours.darkTribeBlue, AppColours.lightGrey],
                    stops: [0.2, 0.2])),
            child: isPhone
                ? Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 32.0),
                          child: Container(
                              height: 60,
                              // padding: const EdgeInsets.all(14.0),
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(14.0))),
                              child: const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 12.0),
                                    child: FlutterLogo(),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: 12.0),
                                    child: TopNavigation(),
                                  ),
                                ],
                              )),
                        ),
                        body,
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 200.0),
                          child: AppText.title("THIS IS BOTTOM BODY"),
                        ),
                      ],
                    ),
                  )
                : LayoutGrid(
                    areas: '''
                nav rightbody
                bottombody bottombody
                ''',
                    columnSizes: [auto, 12.fr],
                    rowSizes: const [auto, auto],
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: _navigation(context, constraints),
                      ).inGridArea('nav'),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.red, width: 2)),
                          child: body,
                          // child: AppText.title("RIGHT BODY"),
                        ),
                      ).inGridArea('rightbody'),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 20.0),
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 200.0),
                              child: AppText.title("THIS IS BOTTOM BODY"),
                            ),
                            _welcomeMessage(context, constraints),
                          ],
                        ),
                      ).inGridArea('bottombody'),
                      // Flexible(child: body)
                    ],
                  ),
          ),
        ),
      );
    });
  }

  Widget _navigation(BuildContext context, BoxConstraints constraints) {
    return Container(
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

  //TODO - REMOVE THIS
  Widget _welcomeMessage(BuildContext context, BoxConstraints constraints) {
    return Container(
        // width: DeviceType().getClampedWidth(constraints),
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
              padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                        child: AppText.profileName(
                      DateTime.now().hour < 12
                          ? "Good Morning, "
                          : DateTime.now().hour < 18
                              ? "Good Afternoon, "
                              : "Good Evening, ",
                      textAlign: TextAlign.center,
                    )),
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                          color: AppColours.comeAroundSundown,
                          borderRadius: BorderRadius.all(
                            Radius.circular(12.0),
                          ),
                        ),
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.payments_outlined,
                                  color: Colors.white, size: 20.0),
                              AppText.message('Tips received',
                                  state: TextState.onDarkBackground),
                            ]),
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                          color: AppColours.comeAroundSundown,
                          borderRadius: BorderRadius.all(
                            Radius.circular(12.0),
                          ),
                        ),
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.volunteer_activism_outlined,
                                  color: Colors.white, size: 20.0),
                              AppText.messageMultiline('Donations',
                                  textAlign: TextAlign.center,
                                  state: TextState.onDarkBackground),
                            ]),
                      ),
                    )
                  ]),
            )
          ],
        ));
  }
}
