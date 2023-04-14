part of 'auth_bloc.dart';

@freezed
abstract class AuthEvent with _$AuthEvent {
  const factory AuthEvent.login(
      {required BuildContext context,
      required String email,
      required String password,
      VoidCallback? onSuccess}) = Login;
}
