import 'package:app_hortifruti_pratico/app/modules/product/controller.dart';
import 'package:app_hortifruti_pratico/app/modules/product/widgets/quantity_and_weight_widget.dart';
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
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                border: Border.all(
                  color: Colors.black12,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Text(
                    'Atere ${produto.isKG ? 'o peso' : 'a quantidade'}',
                    style: const TextStyle(
                        color: Colors.black54, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 4),
                  QuantityAndWeightWidget(
                    isKg: produto.isKG,
                  ),
                ],
              ),
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
