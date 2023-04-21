import 'package:app_hortifruti_pratico/app/modules/product/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:transparent_image/transparent_image.dart';

class ProdutoPage extends GetView<ProdutoController> {
  const ProdutoPage({super.key});

  @override
  Widget build(BuildContext context) {
    var produto = controller.product.value!;
    return Scaffold(
      appBar: AppBar(
        title: Text(produto.nome),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Column(
          children: [
            if (produto.imagem.isNotEmpty)
              Align(
                child: Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image: 'https://loremflickr.com/300/300/food'),
                  ),
                ),
              ),
            if (produto.descricao != null)
              Text(
                produto.descricao!,
                style: Get.textTheme.titleMedium,
              ),
            Text(
              NumberFormat.simpleCurrency().format(produto.preco) +
                  (produto.isKG ? '/kg' : ''),
              style: Get.textTheme.titleLarge,
            ),
            TextField(
              controller: controller.observacaoController,
              decoration: const InputDecoration(
                labelText: 'Observação',
              ),
              maxLength: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: ElevatedButton(
                onPressed: () => controller.addToCart(),
                child: const Text('Adicionar no carrinho'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
