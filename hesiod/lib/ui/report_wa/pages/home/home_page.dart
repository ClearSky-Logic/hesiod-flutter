import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:hesiod/domain/enums/theme/text_state.dart';
import 'package:hesiod/helpers/devicetype.dart';
import 'package:hesiod/helpers/viewmodelroot.dart';
import 'package:hesiod/ui/shared/actions/progress_indicator.dart';
import 'package:hesiod/ui/shared/layout/warningerrorwidget.dart';
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
    // viewModel.getProfileDetails();
    return ViewModelRoot(
        viewModel: viewModel,
        child: Observer(
            builder: (_) => viewModel.isLoading
                ? const Center(child: CustomProgressIndicator())
                : LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints constraints) {
                    bool isPhone = DeviceType().isPhone(constraints);
                    return Padding(
                      padding: EdgeInsets.only(
                          left: 16.0,
                          right: 16.0,
                          top: !isPhone
                              ? kIsWeb
                                  ? 100.0
                                  : 80.0
                              : 0.0),
                      child: Column(mainAxisSize: MainAxisSize.max, children: [
                        _welcomeMessage(context, constraints),
                      ]),
                    );
                  })));
  }

  Widget _welcomeMessage(BuildContext context, BoxConstraints constraints) {
    return Container(
        width: DeviceType().getClampedWidth(constraints),
        decoration: const BoxDecoration(
          color: AppColours.primary,
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
                            state: TextState.onDarkBackground)),
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
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: AppColours.surface, width: 2),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(12.0),
                          ),
                        ),
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.payments_outlined,
                                  color: AppColours.secondary, size: 20.0),
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
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: AppColours.surface, width: 2),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(12.0),
                          ),
                        ),
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.volunteer_activism_outlined,
                                  color: AppColours.secondary, size: 20.0),
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
