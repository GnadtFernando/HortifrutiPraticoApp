import 'package:app_hortifruti_pratico/app/data/models/categoria.dart';
import 'package:app_hortifruti_pratico/app/data/models/payment_method.dart';
import 'package:app_hortifruti_pratico/app/data/models/shipping_by_city.dart';

class StoreModel {
  int id;
  String nome;
  String image;
  bool isOnline;
  List<CategoriaModel> categorias;
  List<ShippingByCityModel> shippingByCity;
  List<PaymentMethodModel> paymentMethods;

  StoreModel({
    required this.id,
    required this.nome,
    required this.image,
    required this.isOnline,
    required this.categorias,
    required this.shippingByCity,
    required this.paymentMethods,
  });

  factory StoreModel.fromJson(Map<String, dynamic> json) => StoreModel(
        id: json['id'],
        nome: json['nome'],
        image: json['logo'] ??
            'https://webevolui.com.br/principal/images/web-evolui-logo.png',
        isOnline: json['isOnline'] == 1,
        categorias: json['categorias'] == null
            ? []
            : List<CategoriaModel>.from(
                json['categorias']
                    .map((produtos) => CategoriaModel.fromJson(produtos)),
              ),
        shippingByCity: json['cidades'] == null
            ? []
            : List<ShippingByCityModel>.from(
                json['cidades']
                    .map((city) => ShippingByCityModel.fromJson(city)),
              ),
        paymentMethods: json['meios_pagamentos'] == null
            ? []
            : List<PaymentMethodModel>.from(
                json['meios_pagamentos'].map((paymentMethod) =>
                    PaymentMethodModel.fromJson(paymentMethod)),
              ),
      );
}
