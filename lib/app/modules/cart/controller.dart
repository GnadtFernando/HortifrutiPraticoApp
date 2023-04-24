import 'package:app_hortifruti_pratico/app/data/models/cart_product.dart';
import 'package:app_hortifruti_pratico/app/data/models/store.dart';
import 'package:app_hortifruti_pratico/app/data/services/cart/service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final _cartService = Get.find<CartService>();
  List<CartProductModel> get products => _cartService.products;
  StoreModel? get store => _cartService.store.value;
  final observacaoController = TextEditingController();

  @override
  void onInit() {
    observacaoController.text = _cartService.observacao.value;
    observacaoController.addListener(() {
      _cartService.observacao.value = observacaoController.text;
    });
    super.onInit();
  }

  void removeProduct(CartProductModel cartProductModel) {
    _cartService.removeProductFromCart(cartProductModel);
  }
}
