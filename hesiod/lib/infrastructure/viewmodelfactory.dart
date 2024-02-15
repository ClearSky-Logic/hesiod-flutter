import 'package:hesiod/ui/report_wa/pages/home/home_viewmodel.dart';
import 'package:hesiod/ui/report_wa/pages/login/login_viewmodel.dart';

import 'servicelocator.dart';

class ViewModelFactory {
  final ServiceLocator _locator;

  ViewModelFactory(this._locator);

  LoginViewModel login() => LoginViewModel(_locator.authManager!);

  HomeViewModel home() =>
      HomeViewModel(_locator.hiveService!, _locator.userService!);
}
