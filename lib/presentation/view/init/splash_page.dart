import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:setup_provider/application/auth/auth_bloc.dart';
import 'package:setup_provider/domain/di/di.dart';
import 'package:setup_provider/infastructura/servises/local_store.dart';
import 'package:setup_provider/presentation/view/pages/auth/login_page.dart';
import 'package:setup_provider/presentation/view/pages/main/main_page.dart';

import '../../style/style.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  Future<bool> checkAuth() async {
    final token = LocalStore.getToken();
    return token.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: checkAuth(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data ?? false) {
              return const MainPage(); // mainPage
            } else {
              return BlocProvider(
                create: (context) => AuthBloc(authRepo),
                child: const LoginPage(),
              ); // loginPage
            }
          } else {
            return Scaffold(
              body: Center(
                child: Text("Splash", style: Style.bold(),),
              ),
            );
          }
        });
  }
}
