import 'package:flutter/foundation.dart';
import 'package:hesiod/domain/constants/endpointconstants.dart';
import 'package:hesiod/services/api_service.dart';
import 'package:hesiod/services/hive_service.dart';
import 'package:mobx/mobx.dart';

part 'authmanager.g.dart';

class AuthManager = AbstractAuthManager with _$AuthManager;

abstract class AbstractAuthManager with Store {
  final HiveService _hiveService;
  final ApiService _apiService;

  AbstractAuthManager(
    this._hiveService,
    this._apiService,
  );

  @observable
  AuthState? authState;

  Future _loginApi(String token) async {
    var result =
        await _apiService.getRequest(EndpointConstants.profileEndpoint, token);
    if (result.isSuccess) {
      //  var userDetails = ProfileDTO.fromMap(result.content);
      return null;
    } else {
      return null;
    }
  }

  // @action
  // Future<LoginResponse> login(LoginDTO loginDTO) async {
  //   var user = await _loginWithFirebase(loginDTO);
  //   if (user!.uid != null && user.message == 'loginSuccessful') {
  //     var userDetails = await _loginApi(_hiveService.getToken()!);
  //     if (userDetails != null) {
  //       PackageInfo packageInfo = await PackageInfo.fromPlatform();
  //       _hiveService.addVersionNumber(packageInfo.version);
  //       _hiveService.addLoginDetails(loginDTO);
  //       _hiveService.addProfileDetails(userDetails);
  //       if (!kIsWeb) {
  //         _pushNotificationService.setupInteractedMessage();
  //       }
  //       authState = AuthState(_hiveService.getToken());
  //       return LoginResponse.success();
  //     } else {
  //       authState = AuthState();
  //       return LoginResponse.fail(LoginFailure.invalid);
  //     }
  //   } else {
  //     authState = AuthState();
  //     return LoginResponse.fail(user.message == 'wrongPassword'
  //         ? LoginFailure.wrongPassword
  //         : user.message == 'userNotFound'
  //             ? LoginFailure.userNotFound
  //             : user.message == 'userDisabled'
  //                 ? LoginFailure.userDisabled
  //                 : LoginFailure.invalid);
  //   }
  // }

  // @action
  // Future<LoginResponse> loginWithSavedCredentials() async {
  //   await FirebaseAuth.instance.signOut();
  //   var biometricsPreferences = _hiveService.getBiometricPreferences();
  //   if (biometricsPreferences == null ||
  //       biometricsPreferences.isBiometricPermissionAsked == false ||
  //       biometricsPreferences.isBiometricsEnabled == false) {
  //     authState = AuthState();
  //     return LoginResponse.fail(LoginFailure.invalid);
  //   }
  //   LoginDTO? loginDto = _hiveService.getLoginDetails();

  //   if (loginDto == null ||
  //       loginDto.email.isEmpty && loginDto.password.isEmpty) {
  //     authState = AuthState();
  //     return LoginResponse.fail(LoginFailure.unknown);
  //   } else {
  //     var biometricsResult = await _biometricsService.biometricAuth();
  //     if (biometricsResult) {
  //       try {
  //         var user = await _loginWithFirebase(loginDto);
  //         if (user?.message == "userDisabled") {
  //           return LoginResponse.fail(LoginFailure.userDisabled);
  //         }
  //         if (user != null) {
  //           var token = _hiveService.getToken();
  //           var userDetails = await _loginApi(token!);
  //           if (userDetails != null) {
  //             PackageInfo packageInfo = await PackageInfo.fromPlatform();
  //             _hiveService.addVersionNumber(packageInfo.version);
  //             _hiveService.addProfileDetails(userDetails);
  //             if (!kIsWeb) {
  //               _pushNotificationService.setupInteractedMessage();
  //             }
  //             authState = AuthState(_hiveService.getToken());
  //             return LoginResponse.success();
  //           } else {
  //             authState = AuthState();
  //             return LoginResponse.fail(LoginFailure.invalid);
  //           }
  //         }
  //       } catch (e) {
  //         authState = AuthState();
  //         return LoginResponse.fail(LoginFailure.invalid);
  //       }
  //     } else {
  //       authState = AuthState();
  //       return LoginResponse.fail(LoginFailure.invalid);
  //     }
  //   }
  //   authState = AuthState();
  //   return LoginResponse.fail(LoginFailure.invalid);
  // }

  // @action
  // Future logout() async {
  //   if (!kIsWeb) {
  //     await _pushNotificationService.unregisterNotifications();
  //   }
  //   await _firebaseAuthService.signOut();
  //   _hiveService.clearToken();
  //   _hiveService.clearCredentials();
  // }
}

class AuthState {
  String? token;
  bool? isLoggedIn;

  AuthState([this.token]) {
    isLoggedIn = token != null;
  }
}
