// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authmanager.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthManager on AbstractAuthManager, Store {
  late final _$authStateAtom =
      Atom(name: 'AbstractAuthManager.authState', context: context);

  @override
  AuthState? get authState {
    _$authStateAtom.reportRead();
    return super.authState;
  }

  @override
  set authState(AuthState? value) {
    _$authStateAtom.reportWrite(value, super.authState, () {
      super.authState = value;
    });
  }

  @override
  String toString() {
    return '''
authState: ${authState}
    ''';
  }
}
