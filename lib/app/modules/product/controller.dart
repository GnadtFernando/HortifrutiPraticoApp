import 'package:app_hortifruti_pratico/app/data/models/produto.dart';
import 'package:app_hortifruti_pratico/app/data/models/store.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProdutoController extends GetxController {
  final product = Rxn<ProductModel>();
  final store = Rxn<StoreModel>();
  final observacaoController = TextEditingController();

  @override
  void onInit() {
    product.value = Get.arguments['product'];
    store.value = Get.arguments['store'];
    super.onInit();
  }

  void addToCart() {
    observacaoController.text;
  }
}
