import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:hesiod/domain/constants/routes.dart';
import 'package:hesiod/helpers/stringextension.dart';
import 'package:hesiod/helpers/viewmodelroot.dart';
import 'package:hesiod/ui/shared/actions/keyboard_dismiss.dart';
import 'package:hesiod/ui/shared/actions/progress_indicator.dart';
import 'package:hesiod/ui/shared/buttons/roundflatbutton.dart';
import 'package:hesiod/ui/shared/layout/customformfield.dart';
import 'package:hesiod/ui/shared/layout/main_logo_image.dart';
import 'package:hesiod/ui/shared/layout/passwordformfield.dart';
import 'package:hesiod/ui/shared/layout/responsivepadding.dart';
import 'package:hesiod/ui/shared/layout/warningerrorwidget.dart';
import 'package:hesiod/ui/shared/theme/colour_palette.dart';

import 'login_viewmodel.dart';

class LoginPage extends StatelessWidget {
  final LoginViewModel viewModel;

  LoginPage(this.viewModel, {super.key});

  final loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ViewModelRoot(
        viewModel: viewModel,
        child: LayoutBuilder(builder: (context, BoxConstraints constraints) {
          return Scaffold(
              backgroundColor: AppColours.surface,
              body: Observer(
                  builder: (context) => viewModel.isLoading
                      ? const CustomProgressIndicator()
                      : SafeArea(
                          child: KeyboardDismiss(
                              child: SingleChildScrollView(
                                  child: _credentialsForm(
                                      context, constraints))))));
        }));
  }

  Widget _credentialsForm(BuildContext context, BoxConstraints constraints) {
    return ResponsivePadding(
      top: 20.0,
      bottom: 20.0,
      left: 20.0,
      right: 20.0,
      child: AutofillGroup(
        child: Form(
            key: loginFormKey,
            child: Column(
              children: [
                // const LogoImage(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: CustomFormField(
                    autofillHints: const [AutofillHints.username],
                    keyboardType: TextInputType.emailAddress,
                    header: 'Email address',
                    hint: 'example@urocked.com',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Required';
                      } else if (!value.trim().isValidEmail()) {
                        return 'Enter valid email';
                      }
                      return null;
                    },
                    value: viewModel.email,
                    keyName: 'emailField',
                  ),
                ),
                PasswordFormField(
                  autofillHints: const [AutofillHints.password],
                  header: 'Password',
                  hint: '**********',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Required';
                    }
                    return null;
                  },
                  value: viewModel.password,
                  keyName: 'passField',
                ),
                // Align(
                //     alignment: Alignment.center,
                //     child: _forgotPassword(context)),
                Padding(
                    padding: const EdgeInsets.only(top: 20.0, bottom: 12.0),
                    child: RoundFlatButton(
                        text: 'Log In',
                        onPressed: () {
                          // if (loginFormKey.currentState!.validate()) {
                          // TextInput.finishAutofillContext();
                          // viewModel.isLoading = true;
                          context.goNamed(Routes.home.name);
                          // viewModel.login(context);
                          // }
                        })),
              ],
            )),
      ),
    );
  }

  // Widget _forgotPassword(BuildContext context) {
  //   return Padding(
  //       padding: const EdgeInsets.only(top: 12.0),
  //       child: RichText(
  //           textAlign: TextAlign.center,
  //           text: TextSpan(children: [
  //             TextSpan(
  //                 text: "Forgot your password?",
  //                 style: const TextStyle(
  //                     fontSize: 16,
  //                     color: AppColours.surface,
  //                     fontFamily: 'Sofia',
  //                     fontWeight: FontWeight.w300),
  //                 recognizer: TapGestureRecognizer()
  //                   ..onTap = () => context.goNamed(Routes.forgotPassword.name,
  //                           pathParameters: {
  //                             "isDisabled": viewModel.isDisabled.toString()
  //                           }))
  //           ])));
  // }
}
