// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_hortifruti_pratico/app/data/models/produto.dart';

class CartProductModel {
  ProductModel productModel;
  num quantity;
  String? observation;

  CartProductModel({
    required this.productModel,
    required this.quantity,
    this.observation,
  });

  num get total => productModel.preco * quantity;
}
