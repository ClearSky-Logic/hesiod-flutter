import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hesiod/domain/constants/routes.dart';
import 'package:hesiod/domain/enums/theme/text_state.dart';
import 'package:hesiod/services/hive_service.dart';
import 'package:hesiod/ui/shared/buttons/flatsurfacebutton.dart';
import 'package:hesiod/ui/shared/theme/colour_palette.dart';
import 'package:hesiod/ui/shared/theme/text.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    HiveService hiveService = HiveService();
    return Drawer(
        backgroundColor: AppColours.surface,
        width: MediaQuery.of(context).size.width * 0.9,
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                        icon: Icon(Icons.adaptive.arrow_back),
                        onPressed: () => context.pop(),
                        color: AppColours.primary),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, bottom: 12.0),
                      child: Padding(
                          padding: const EdgeInsets.only(top: 12.0),
                          child: Column(children: [
                            FlatSurfaceButton(
                                'Digital Wallet', Icons.wallet_rounded, () {
                              context.goNamed(Routes.home.name);
                              Navigator.pop(context);
                            }),
                            FlatSurfaceButton(
                                'Tipping History', Icons.dashboard_rounded, () {
                              context.goNamed(Routes.home.name);
                              Navigator.pop(context);
                            }),
                            FlatSurfaceButton('Team Tips', Icons.people_alt,
                                () {
                              context.goNamed(Routes.home.name);
                              Navigator.pop(context);
                            }),
                            FlatSurfaceButton(
                                'Receive A Tip', Icons.qr_code_scanner, () {
                              context.goNamed(Routes.home.name);
                              Navigator.pop(context);
                            })
                          ])),
                    )
                  ],
                ),
              ]),
        )));
  }
}
