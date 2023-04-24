import 'package:app_hortifruti_pratico/app/data/models/cart_product.dart';
import 'package:app_hortifruti_pratico/app/modules/cart/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CartPage extends GetView<CartController> {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Carrinho')),
      body: SingleChildScrollView(
        child: Obx(
          () => Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: TextField(
                  controller: controller.observacaoController,
                  decoration: const InputDecoration(
                    labelText: 'Observação',
                  ),
                  maxLength: 80,
                ),
              ),
              if (controller.store != null)
                Align(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: Text(controller.store!.nome),
                  ),
                ),
              for (var cartProduct in controller.products)
                ListTile(
                  title: Text(cartProduct.productModel.nome),
                  subtitle: Text(
                    '${NumberFormat.simpleCurrency().format(cartProduct.total)} (${NumberFormat.simpleCurrency().format(cartProduct.productModel.preco)})',
                  ),
                  leading: _buildProductQuantity(cartProduct),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => controller.removeProduct(cartProduct),
                  ),
                ),
              if (controller.products.isEmpty)
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text('Seu carrinho está vazio'),
                )
              else
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Avançar'),
                )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductQuantity(CartProductModel cartProductModel) {
    return Text(
      NumberFormat.decimalPattern().format(cartProductModel.quantity) +
          (cartProductModel.productModel.isKG ? 'kg' : 'x'),
    );
  }
}
