import 'package:app_hortifruti_pratico/app/modules/checkout/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CheckoutPage extends GetView<CheckoutController> {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Checkout')),
      body: SingleChildScrollView(
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Text(
                  'Endereço',
                  style: Get.textTheme.titleLarge,
                ),
              ),
              if (controller.isLogged)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (controller.addresses.isEmpty)
                        OutlinedButton(
                          onPressed: controller.goToNewAddress,
                          child: const Text('Cadastrar um endereço'),
                        )
                    ],
                  ),
                )
              else
                Center(
                  child: OutlinedButton(
                    onPressed: controller.goToLogin,
                    child: const Text('Entre com a sua conta para continuar'),
                  ),
                ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Text(
                  'Forma de pagamento',
                  style: Get.textTheme.titleLarge,
                ),
              ),
              for (var paymentMethod in controller.paymentMethods)
                RadioListTile(
                  title: Text(paymentMethod.nome),
                  value: paymentMethod,
                  groupValue: controller.paymentMethod.value,
                  onChanged: controller.changePaymentMethod,
                ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Produtos: ',
                        style: Get.textTheme.titleMedium,
                      ),
                    ),
                    Text(
                      NumberFormat.simpleCurrency()
                          .format(controller.totalCart),
                      style: Get.textTheme.titleMedium,
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Custo de entrega: ',
                        style: Get.textTheme.titleMedium,
                      ),
                    ),
                    Text(
                      NumberFormat.simpleCurrency()
                          .format(controller.deliveryCost),
                      style: Get.textTheme.titleMedium,
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Total: ',
                        style: Get.textTheme.titleLarge,
                      ),
                    ),
                    Text(
                      NumberFormat.simpleCurrency()
                          .format(controller.totalOrder),
                      style: Get.textTheme.titleLarge,
                    ),
                  ],
                ),
              ),
              Align(
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Enviar pedido'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
