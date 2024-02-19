import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hesiod/domain/enums/theme/text_state.dart';
import 'package:hesiod/domain/models/utility/customwidgetlayout.dart';
import 'package:hesiod/helpers/viewmodelroot.dart';
import 'package:hesiod/ui/shared/actions/progress_indicator.dart';
import 'package:hesiod/ui/shared/charts/circlechart.dart';
import 'package:hesiod/ui/shared/charts/linechart.dart';
import 'package:hesiod/ui/shared/layout/customscaffold.dart';
import 'package:hesiod/ui/shared/theme/colour_palette.dart';
import 'package:hesiod/ui/shared/theme/text.dart';

import 'home_viewmodel.dart';

class HomePage extends StatelessWidget {
  final HomeViewModel viewModel;

  const HomePage(
    this.viewModel, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ViewModelRoot(
        viewModel: viewModel,
        child: Observer(
          builder: (_) => viewModel.isLoading
              ? const Center(child: CustomProgressIndicator())
              : CustomScaffold(
                  rightBody: [
                    CustomWidgetLayout([_welcomeMessage(context)], false),
                    CustomWidgetLayout(const [
                      LineChart(),
                      CircleChart(),
                    ], true),
                    // CustomWidgetLayout(const [LineChart()], false)
                  ],
                  bottomBody: _welcomeMessage(context),
                ),
        ));
  }

  Widget _welcomeMessage(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          color: Colors.white,
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
