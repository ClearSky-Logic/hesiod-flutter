import 'package:flutter/material.dart';
import 'package:hesiod/managers/authmanager.dart';
import 'package:mobx/mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:hesiod/helpers/viewmodel.dart';

part 'login_viewmodel.g.dart';

class LoginViewModel = AbstractLoginViewModel with _$LoginViewModel;

abstract class AbstractLoginViewModel extends ViewModel with Store {
  final AuthManager _authManager;

  AbstractLoginViewModel(this._authManager);

  @observable
  bool isLoading = false, isDisabled = false;

  @observable
  TextEditingController email = TextEditingController();

  @observable
  TextEditingController password = TextEditingController();

  // @action
  // Future login(BuildContext context) async {
  //   isLoading = true;
  //   isDisabled = false;
  //   var loginDTO = LoginDTO(email.text.trim(), password.text);
  //   await _authManager.login(loginDTO).then((loginResponse) {
  //     if (loginResponse.isSuccess!) {
  //       context.goNamed(Routes.home.name);
  //     } else {
  //       isLoading = false;
  //       if (loginResponse.failure == LoginFailure.userDisabled) {
  //         isDisabled = true;
  //         return; //no need to show snackbar
  //       }
  //       CustomSnackbar.showSnackbar(
  //         context,
  //         loginResponse.failure == LoginFailure.wrongPassword
  //             ? "Wrong password for ${loginDTO.email}"
  //             : loginResponse.failure == LoginFailure.userNotFound
  //                 ? "There is no user registered with ${loginDTO.email}."
  //                 : "We couldn't log you in at the moment, please try again later.",
  //       );
  //     }
  //   });
  // }
}
