import 'package:app_hortifruti_pratico/app/modules/login/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Column(
          children: [
            TextFormField(
              controller: controller.emailController,
              decoration: const InputDecoration(labelText: 'Email'),
              validator: (String? value) {
                if (value != null && value.isEmpty) {
                  return 'Informe o seu email';
                }
                return null;
              },
            ),
            TextFormField(
              obscureText: true,
              controller: controller.passwordController,
              decoration: const InputDecoration(labelText: 'Senha'),
              validator: (String? value) {
                if (value != null && value.isEmpty) {
                  return 'Informe a sua senha';
                }
                return null;
              },
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: ElevatedButton(
                      onPressed: controller.login,
                      child: const Text('Entrar'),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    child: const Text('Quero criar a minha conta'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
