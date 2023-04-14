import 'dart:async';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:setup_provider/infastructura/servises/app_helper.dart';

import '../../domain/facade/auth_facade.dart';

part 'auth_event.dart';

part 'auth_state.dart';

part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthFacade auth;

  AuthBloc(this.auth) : super(const AuthState()) {
    on<Login>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      final res = await auth.login(event.email,event.password);
      res.fold((l) {
        event.onSuccess?.call();
      }, (r) {
        AppHelper.errorSnackBar(
          context: event.context,
          message: r,
        );
      });

      emit(state.copyWith(isLoading: false));
    });
  }
}
