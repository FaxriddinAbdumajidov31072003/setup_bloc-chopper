import 'package:chopper/chopper.dart';

import '../servises/app_constant.dart';
import 'built_value_converter.dart';

part 'api_chopper.chopper.dart';

@ChopperApi(baseUrl: '/api/v1/auth/')
abstract class AuthService extends ChopperService {
  @Post(path: 'login')
  Future<Response<dynamic>> login(
    @Query("email") String email,
    @Query("password") String password,
  );

  static AuthService create() =>
      _$AuthService(_Client(AppConstant.baseUrl, true));
}

class _Client extends ChopperClient {
  _Client(String baseUrl, bool useInterceptors)
      : super(
          baseUrl: Uri.parse(baseUrl),
          interceptors: useInterceptors
              ? [
                  HttpLoggingInterceptor(),
                  CurlInterceptor(),
                  HttpLoggingInterceptor()
                  // BackendException(),
                ]
              : const [],
          converter: BuiltValueConverter(),
        );
}
