import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:setup_provider/domain/facade/auth_facade.dart';
import 'package:setup_provider/domain/model/user_model.dart';
import 'package:setup_provider/infastructura/chopper/api_chopper.dart';
import 'package:setup_provider/infastructura/servises/dio.dart';

import '../servises/error_handler.dart';

class AuthRepo implements AuthFacade {
  final AuthService authService;

  AuthRepo(this.authService);

  @override
  Future<Either<UserModel, String>> login(String email,String password) async {
    try {
      // final res = await DioService.client().get("/api/v1/auth/login");
      final res = await authService.login(email,password);
      if (res.statusCode == 200) {
        return left(UserModel(firstname: res.body));
      } else {
        return right(res.statusCode.toString());
      }
    } catch (e) {
      return right(e.toString());
    }
  }
}
