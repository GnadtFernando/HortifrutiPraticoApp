import 'package:app_hortifruti_pratico/app/data/models/address.dart';
import 'package:app_hortifruti_pratico/app/data/models/order_product.dart';
import 'package:app_hortifruti_pratico/app/data/models/order_status.dart';
import 'package:app_hortifruti_pratico/app/data/models/payment_method.dart';
import 'package:app_hortifruti_pratico/app/data/models/store.dart';

class OrderModel {
  String hashId;
  StoreModel store;
  num value;
  num deliveryCost;
  AddressModel? address;
  PaymentMethodModel? paymentMethod;
  List<OrderProductModel> productList;
  List<OrderStatusModel> statusList;
  String? observation;
  DateTime createdAt;
  num? trocoPara;

  OrderModel({
    required this.hashId,
    required this.store,
    required this.value,
    required this.deliveryCost,
    this.address,
    this.paymentMethod,
    required this.statusList,
    required this.productList,
    this.observation,
    required this.createdAt,
    this.trocoPara,
  });
  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
      hashId: json['hash_id'],
      store: StoreModel.fromJson(json['estabelecimento']),
      value: json['valor'],
      deliveryCost: json['custo_entrega'],
      observation: json['observacao'],
      createdAt: DateTime.parse(json['created_at']),
      statusList: json['pedido_status'] == null
          ? []
          : List<OrderStatusModel>.from(
              json['pedido_status'].map(
                (status) => OrderStatusModel.fromJson(status),
              ),
            ),
      productList: json['produtos'] == null
          ? []
          : List<OrderProductModel>.from(
              json['produtos'].map(
                (product) => OrderProductModel.fromJson(product),
              ),
            ),
      address: json['endereco'] == null
          ? null
          : AddressModel.fromJson(
              json['endereco'],
            ),
      paymentMethod: json['meio_pagamento'] == null
          ? null
          : PaymentMethodModel.fromJson(
              json['meio_pagamento'],
            ),
      trocoPara: json['troco_para'] ?? 0);
}
