import 'package:app_hortifruti_pratico/app/modules/product/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProdutoPage extends GetView<ProdutoController> {
  const ProdutoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.product.value!.nome),
      ),
    );
  }
}
