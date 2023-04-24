import 'package:app_hortifruti_pratico/app/data/models/cart_product.dart';
import 'package:app_hortifruti_pratico/app/data/models/produto.dart';
import 'package:app_hortifruti_pratico/app/data/models/store.dart';
import 'package:app_hortifruti_pratico/app/data/services/cart/service.dart';
import 'package:app_hortifruti_pratico/app/modules/product/widgets/quantity_and_weight_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProdutoController extends GetxController {
  final product = Rxn<ProductModel>();
  final store = Rxn<StoreModel>();
  final observacaoController = TextEditingController();
  final _cartService = Get.find<CartService>();

  @override
  void onInit() {
    product.value = Get.arguments['product'];
    store.value = Get.arguments['store'];
    super.onInit();
  }

  void addToCart() {
    var quantity = Get.find<QuantityAndWeightController>().quantity;

    // _cartService.newCart(store.value!);

    _cartService.addProductToCart(
      CartProductModel(
        productModel: product.value!,
        quantity: quantity,
        observation: observacaoController.text,
      ),
    );

    ScaffoldMessenger.of(Get.overlayContext!).showSnackBar(
      SnackBar(
        content:
            Text('O item ${product.value!.nome} foi adicionado no carrinho.'),
      ),
    );

    Future.delayed(const Duration(milliseconds: 300), () => Get.back());
  }
}
