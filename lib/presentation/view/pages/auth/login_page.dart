import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:setup_provider/application/auth/auth_bloc.dart';
import 'package:setup_provider/infastructura/servises/app_validators.dart';
import 'package:setup_provider/presentation/components/custom_button.dart';
import 'package:setup_provider/presentation/components/custom_text_form_field.dart';
import 'package:setup_provider/presentation/route.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          "Login Page",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomTextFormField(
                controller: emailController,
                validator: (s) {
                  if (AppValidators.isValidEmail(s ?? "")) {
                    return null;
                  } else {
                    return "Email Xatto";
                  }
                },
                label: "Login",
              ),
               CustomTextFormField(
                controller: passwordController,
                validator: (s) {
                  if (AppValidators.isValidPassword(s ?? "")) {
                    return null;
                  } else {
                    return "paswword is  Incorrect";
                  }
                },
                label: "Password",
              ),
              BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  return CustomButton(
                    onTap: () {
                      if (formKey.currentState?.validate() ?? false) {
                        context.read<AuthBloc>().add(AuthEvent.login(
                            context: context,
                            email: emailController.text,
                            password: passwordController.text,
                            onSuccess: () {
                              AppRoute.goMain(context);
                            }));
                      }
                    },
                    title: "Login",
                    isLoading: state.isLoading,
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
