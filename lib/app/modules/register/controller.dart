import 'package:app_hortifruti_pratico/app/data/models/user_login_request.dart';
import 'package:app_hortifruti_pratico/app/data/models/user_profile_request.dart';
import 'package:app_hortifruti_pratico/app/data/services/auth/service.dart';
import 'package:app_hortifruti_pratico/app/modules/register/repository.dart';
import 'package:app_hortifruti_pratico/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final RegisterRepository _repository;
  RegisterController(this._repository);

  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController(text: 'Nome de teste');
  final emailController =
      TextEditingController(text: 'teste.cliente@teste.com');
  final phoneController = TextEditingController(text: '31 3131-3131');
  final passwordController = TextEditingController(text: 'senha123456');
  final _authService = Get.find<AuthService>();

  void submit() {
    Get.focusScope!.unfocus();

    if (!formKey.currentState!.validate()) {
      return;
    }

    final userProfileRequest = UserProfileRequestModel(
      nome: nameController.text,
      phone: phoneController.text,
      email: emailController.text,
      password: passwordController.text,
    );

    _repository.register(userProfileRequest).then(
      (value) async {
        await _authService.login(
          UserLoginRequestModel(
            email: emailController.text,
            password: passwordController.text,
          ),
        );
        ScaffoldMessenger.of(Get.overlayContext!).showSnackBar(
          const SnackBar(
            content: Text('Cadastro feito com sucesso.'),
          ),
        );

        Get.offAllNamed(Routes.dashboard);
      },
      onError: (error) {
        Get.dialog(
          AlertDialog(
            title: Text(
              error.toString(),
            ),
          ),
        );
      },
    );
  }
}
