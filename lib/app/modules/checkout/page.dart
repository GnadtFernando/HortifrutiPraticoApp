import 'package:app_hortifruti_pratico/app/modules/checkout/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutPage extends GetView<CheckoutController> {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('CheckoutPage')),
        body: const SafeArea(child: Text('CheckoutController')));
  }
}
