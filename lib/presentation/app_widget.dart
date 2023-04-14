import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:setup_provider/presentation/view/init/no_internet.dart';
import 'package:setup_provider/presentation/view/init/splash_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (BuildContext context, Widget? child) {
          return MaterialApp(
            home: StreamBuilder(
              stream: Connectivity().onConnectivityChanged,
              builder: (
                BuildContext context,
                AsyncSnapshot<ConnectivityResult> snapshot,
              ) {
                if (snapshot.data == ConnectivityResult.wifi ||
                    snapshot.data == ConnectivityResult.mobile) {
                  return const SplashPage();
                } else {
                  return const NoInternet();
                }
              },
            ),
          );
        });
  }
}
