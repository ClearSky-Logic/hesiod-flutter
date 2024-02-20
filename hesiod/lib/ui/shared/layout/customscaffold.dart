import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:hesiod/domain/models/utility/customwidgetlayout.dart';
import 'package:hesiod/helpers/devicetype.dart';
import 'package:hesiod/ui/shared/layout/footer.dart';
import 'package:hesiod/ui/shared/layout/topnavigation.dart';
import 'package:hesiod/ui/shared/theme/colour_palette.dart';

class CustomScaffold extends StatelessWidget {
  final String title;
  final Widget? body;
  final List<CustomWidgetLayout> rightBody;
  final Widget? bottomBody;
  final FloatingActionButton? floatingActionButton;
  final bool isStepper;
  final bool hasFooter;

  const CustomScaffold(
      {super.key,
      this.body,
      required this.rightBody,
      this.bottomBody,
      this.floatingActionButton,
      this.title = '',
      this.isStepper = false,
      this.hasFooter = false});

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
                child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: constraints.maxHeight),
          child: IntrinsicHeight(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(children: [
                  Container(
                    color: AppColours.darkTribeBlue,
                    height: constraints.maxHeight / 3,
                  ),
                  isPhone
                      ? Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              TopNavigation(constraints),
                              for (var widgetList in rightBody) ...[
                                for (var widget in widgetList.widgets) ...[
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12.0),
                                    child: widget,
                                  )
                                ]
                              ],
                              if (bottomBody != null) ...[
                                bottomBody!,
                              ],
                            ],
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 48.0),
                          child: LayoutGrid(
                            rowGap: 12.0,
                            columnGap: 12.0,
                            //for bigger screen sizes
                            areas: '''
                                    nav rightbody
                                    bottombody bottombody
                                    footer footer
                                    ''',
                            columnSizes: [auto, 2.fr],
                            rowSizes: const [auto, auto, auto],
                            children: [
                              TopNavigation(constraints).inGridArea('nav'),
                              Column(
                                children: rightBodyHandler(rightBody),
                              ).inGridArea("rightbody"),
                              Column(
                                children: [
                                  bottomBody!,
                                ],
                              ).inGridArea('bottombody'),
                            ],
                          ),
                        ),
                ]),
                Expanded(child: SizedBox(child: Footer(constraints)))
              ],
            ),
          ),
        )),
      );
    });
  }

  List<Widget> rightBodyHandler(List<CustomWidgetLayout> rightBody) {
    List<Widget> list = [];
    for (var widgetList in rightBody) {
      if (widgetList.isRowOnFullScreen) {
        list.add(Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            for (var widget in widgetList.widgets) ...[
              Expanded(
                  child: Padding(
                padding: EdgeInsets.only(
                    right: widget != widgetList.widgets.last ? 12.0 : 0.0),
                child: widget,
              ))
            ]
          ]),
        ));
      } else {
        for (var widget in widgetList.widgets) {
          list.add(widget);
        }
      }
    }
    return list;
  }
}
