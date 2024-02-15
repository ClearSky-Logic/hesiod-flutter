class LoginResponse {
  bool? isSuccess;
  LoginFailure? failure;

  LoginResponse.success() {
    isSuccess = true;
  }

  LoginResponse.fail(LoginFailure fail) {
    isSuccess = false;
    failure = fail;
  }
}

enum LoginFailure {
  invalid,
  unknown,
  userNotFound,
  wrongPassword,
  userDisabled
}
