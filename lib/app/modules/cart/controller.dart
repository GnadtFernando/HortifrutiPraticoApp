import 'package:app_hortifruti_pratico/app/data/models/cart_product.dart';
import 'package:app_hortifruti_pratico/app/data/models/store.dart';
import 'package:app_hortifruti_pratico/app/data/services/cart/service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CartController extends GetxController {
  final _cartService = Get.find<CartService>();
  List<CartProductModel> get products => _cartService.products;
  final observacaoController = TextEditingController();
  StoreModel? get store => _cartService.store.value;

  void removeProduct(CartProductModel cartProductModel) {
    _cartService.removeProductFromCart(cartProductModel);
  }
}
