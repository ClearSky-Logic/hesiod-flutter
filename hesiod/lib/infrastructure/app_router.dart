import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hesiod/domain/constants/routes.dart';
import 'package:hesiod/infrastructure/errorpage.dart';
import 'package:hesiod/infrastructure/servicelocator.dart';
import 'package:hesiod/infrastructure/viewmodelfactory.dart';
import 'package:hesiod/ui/report_wa/pages/home/home_page.dart';
import 'package:hesiod/ui/report_wa/pages/login/login_page.dart';
import 'package:hesiod/ui/shared/actions/progress_indicator.dart';
import 'package:hesiod/ui/shared/layout/customscaffold.dart';

final servLoc = ServiceLocator();
final viewModelFactory = ViewModelFactory(servLoc);
const unauthenticatedOnlyRoutes = [
  "/login/false",
  "/login/true",
  "/login/signup",
  "/login/false/signup",
  "/login/true/signup",
  "/login/false/forgot-password",
  "/login/true/forgot-password"
];

final GoRouter router =
    GoRouter(errorBuilder: (context, state) => const ErrorPage(), routes: [
  GoRoute(
    redirect: (context, state) async => '/login',
    path: '/',
    pageBuilder: (context, state) => const MaterialPage<void>(
      child: CustomProgressIndicator(),
    ),
  ),
  GoRoute(
    name: Routes.login.name,
    path: '/login',
    pageBuilder: (context, state) => MaterialPage<void>(
      child: LoginPage(viewModelFactory.login()),
    ),
    // routes: [
    //   GoRoute(
    //     name: Routes.forgotPassword.name,
    //     path: 'forgot-password',
    //     pageBuilder: (context, state) => const MaterialPage<void>(
    //       child: ForgotPasswordPage(),
    //     ),
    //   ),

    // ]
  ),
  ShellRoute(
      builder: (context, state, child) {
        return child;
      },
      routes: [
        GoRoute(
          name: Routes.home.name,
          path: '/home',
          pageBuilder: (context, state) => MaterialPage<void>(
            child: HomePage(viewModelFactory.home()),
          ),
        ),
        // GoRoute(
        //   name: Routes.id.name,
        //   path: '/id',
        //   pageBuilder: (context, state) => MaterialPage<void>(
        //     child: IdPage(viewModelFactory.id()),
        //   ),
        // ),
        // GoRoute(
        //   name: Routes.profile.name,
        //   path: '/profile',
        //   pageBuilder: (context, state) => MaterialPage<void>(
        //     child: ProfilePage(viewModelFactory.profile()),
        //   ),
        // ),
        // GoRoute(
        //   name: Routes.digitalWallet.name,
        //   path: '/wallet',
        //   pageBuilder: (context, state) => MaterialPage<void>(
        //     child: DigitalWalletPage(viewModelFactory.digitalWallet()),
        //   ),
        // ),
        // GoRoute(
        //   name: Routes.tipHistory.name,
        //   path: '/tip-history',
        //   pageBuilder: (context, state) => MaterialPage<void>(
        //     child: TipHistoryPage(viewModelFactory.tipHistory()),
        //   ),
        // ),
      ]),
]);
