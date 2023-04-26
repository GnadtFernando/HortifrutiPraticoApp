import 'package:app_hortifruti_pratico/app/modules/user_address/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserAddressPage extends GetView<UserAddressController> {
  const UserAddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Novo Endereço')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Column(
          children: [
            TextFormField(
              controller: controller.streetController,
              decoration: const InputDecoration(labelText: 'Rua'),
              validator: (String? value) {
                if (value != null && value.isEmpty) {
                  return 'Preencha o nome da rua';
                }
                return null;
              },
            ),
            TextFormField(
              controller: controller.numberController,
              decoration: const InputDecoration(labelText: 'Número'),
              validator: (String? value) {
                if (value != null && value.isEmpty) {
                  return 'Preencha o número da casa/apartamento';
                }
                return null;
              },
            ),
            TextFormField(
              controller: controller.neighborhoodController,
              decoration: const InputDecoration(labelText: 'Bairro'),
              validator: (String? value) {
                if (value != null && value.isEmpty) {
                  return 'Preencha o nome do bairro';
                }
                return null;
              },
            ),
            TextFormField(
              controller: controller.referencePointController,
              decoration:
                  const InputDecoration(labelText: 'Ponto de referência'),
              validator: (String? value) {
                if (value != null && value.isEmpty) {
                  return 'Informe um ponto de referência para o entregador';
                }
                return null;
              },
            ),
            TextFormField(
              controller: controller.complementController,
              decoration: const InputDecoration(labelText: 'Complemento'),
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: ElevatedButton(
                      onPressed: controller.submit,
                      child: const Text('Adicionar'),
                    ),
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