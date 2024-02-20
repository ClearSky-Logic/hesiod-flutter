import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hesiod/domain/constants/routes.dart';
import 'package:hesiod/domain/enums/theme/text_state.dart';
import 'package:hesiod/helpers/devicetype.dart';
import 'package:hesiod/ui/shared/theme/colour_palette.dart';
import 'package:hesiod/ui/shared/theme/text.dart';

class TopNavigation extends StatefulWidget {
  final BoxConstraints constraints;
  const TopNavigation(this.constraints, {super.key});

  @override
  State<TopNavigation> createState() => _TopNavigationState();
}

enum SampleItem { itemOne, itemTwo, itemThree }

class _TopNavigationState extends State<TopNavigation> {
  SampleItem? selectedItem;
  @override
  Widget build(BuildContext context) {
    final bool isPhone = DeviceType().isPhone(widget.constraints);

    return !isPhone
        ? _navigation(context)
        : Padding(
            padding: const EdgeInsets.only(bottom: 32.0),
            child: Container(
                height: 60,
                // padding: const EdgeInsets.all(14.0),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(14.0))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 12.0),
                      child: FlutterLogo(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: topNav(context),
                    ),
                  ],
                )),
          );
  }

  PopupMenuButton<SampleItem> topNav(BuildContext context) {
    return PopupMenuButton<SampleItem>(
      color: Colors.white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(14.0))),
      surfaceTintColor: Colors.transparent,
      constraints: BoxConstraints.expand(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height / 2),
      icon: const Icon(
        Icons.menu,
      ),
      initialValue: selectedItem,
      onSelected: (SampleItem item) {
        setState(() {
          selectedItem = item;
        });
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<SampleItem>>[
        PopupMenuItem<SampleItem>(
          value: SampleItem.itemOne,
          child: navLink(Icons.bar_chart_rounded, "Investment Performance",
              selected: true),
        ),
        PopupMenuItem<SampleItem>(
          value: SampleItem.itemTwo,
          child: navLink(Icons.message, "Messages"),
        ),
        PopupMenuItem<SampleItem>(
          value: SampleItem.itemThree,
          child: navLink(Icons.shopping_bag, "Asset Management Request"),
        ),
        PopupMenuItem<SampleItem>(
          value: SampleItem.itemThree,
          child: navLink(Icons.account_circle_rounded, "Investor Profile"),
        ),
        PopupMenuItem<SampleItem>(
          value: SampleItem.itemThree,
          onTap: () => context.goNamed(Routes.login.name),
          child: navLink(Icons.logout_rounded, "Logout"),
        ),
      ],
    );
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

  Widget _navigation(BuildContext context) {
    return Container(
        // height: 500,
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
}
