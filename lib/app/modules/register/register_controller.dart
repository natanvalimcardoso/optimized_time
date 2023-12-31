import 'package:flutter/material.dart';
import 'package:optimized_time/app/modules/register/register_repository.dart';

class RegisterController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController emailConfirmController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController =
      TextEditingController();
  final formKeyRegister = GlobalKey<FormState>();
  final registerRepository = RegisterRepository();

  Future<void> register(
    String email,
    String password,
    BuildContext context,
  ) async {
    await registerRepository.registerApp(
      email: emailController.text,
      password: passwordController.text,
      context: context,
    );
  }
}
