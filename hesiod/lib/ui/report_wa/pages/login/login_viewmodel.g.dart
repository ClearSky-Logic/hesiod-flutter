// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginViewModel on AbstractLoginViewModel, Store {
  late final _$isLoadingAtom =
      Atom(name: 'AbstractLoginViewModel.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$isDisabledAtom =
      Atom(name: 'AbstractLoginViewModel.isDisabled', context: context);

  @override
  bool get isDisabled {
    _$isDisabledAtom.reportRead();
    return super.isDisabled;
  }

  @override
  set isDisabled(bool value) {
    _$isDisabledAtom.reportWrite(value, super.isDisabled, () {
      super.isDisabled = value;
    });
  }

  late final _$emailAtom =
      Atom(name: 'AbstractLoginViewModel.email', context: context);

  @override
  TextEditingController get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(TextEditingController value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: 'AbstractLoginViewModel.password', context: context);

  @override
  TextEditingController get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(TextEditingController value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
isDisabled: ${isDisabled},
email: ${email},
password: ${password}
    ''';
  }
}
