
import 'package:e_learning_app/components/navigator_helper.dart';
import 'package:e_learning_app/components/show_snack_bar.dart';
import 'package:e_learning_app/controllers/auth/auth_cubit.dart';
import 'package:e_learning_app/repos/main/main_repo.dart';
import 'package:e_learning_app/views/auth/components/default_text_field.dart';
import 'package:e_learning_app/views/auth/components/login_button.dart';
import 'package:e_learning_app/views/auth/components/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/Content.png"),
              const SizedBox(height: 50),
              DefaultTextField(controller: emailController, label: "Email"),
              DefaultTextField(
                  controller: passwordController, label: "Password"),
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is ErrorLoginState) {
                    ShowSnackBar.showErrorMessage(
                        MainRepo.authRepo.errorMessage, context);
                  }
                  if (state is SuccessLoginState) {
                    NavigatorHelper.toAndOff(MainScreen(), context);
                  }
                },
                builder: (context, state) {
                  return state is LoadingLoginState
                      ? const Center(child: CircularProgressIndicator())
                      : LoginButton(
                          onPressed: () {
                            AuthCubit.get(context).login(
                              emailController.text,
                              passwordController.text,
                            );
                          },
                        );
                },
              ),
              MaterialButton(
                onPressed: () {},
                child: const Text("Sign up"),
              )
            ],
          ),
        ),
      ),
    );
  }
}