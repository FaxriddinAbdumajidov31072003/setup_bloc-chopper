import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:setup_provider/domain/di/di.dart';
import 'package:setup_provider/presentation/view/pages/auth/login_page.dart';

import '../application/auth/auth_bloc.dart';
import '../application/main/main_bloc.dart';
import 'view/pages/main/main_page.dart';

abstract class AppRoute {
  AppRoute._();

  static goMain(BuildContext context) =>
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (_) =>
              BlocProvider(
                create: (context) => MainBloc(),
                child: const MainPage(),
              ),
        ),
            (route) => false,
      );

  static goLogin(BuildContext context) =>
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (_) =>
              BlocProvider(
                create: (context) => AuthBloc(authRepo),
                child: const LoginPage(),
              ),
        ),
            (route) => false,
      );

}
