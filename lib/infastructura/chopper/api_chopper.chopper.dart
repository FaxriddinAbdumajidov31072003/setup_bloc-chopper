// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_chopper.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$AuthService extends AuthService {
  _$AuthService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = AuthService;

  @override
  Future<Response<dynamic>> login(
    String email,
    String password,
  ) {
    final Uri $url = Uri.parse('/api/v1/auth/login');
    final Map<String, dynamic> $params = <String, dynamic>{
      'email': email,
      'password': password,
    };
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
