import 'dart:convert';

import 'package:app_hortifruti_pratico/app/data/models/address.dart';
import 'package:app_hortifruti_pratico/app/data/models/city.dart';
import 'package:app_hortifruti_pratico/app/data/models/order.dart';
import 'package:app_hortifruti_pratico/app/data/models/order_request.dart';
import 'package:app_hortifruti_pratico/app/data/models/store.dart';
import 'package:app_hortifruti_pratico/app/data/models/user.dart';
import 'package:app_hortifruti_pratico/app/data/models/user_address_request.dart';
import 'package:app_hortifruti_pratico/app/data/models/user_login_request.dart';
import 'package:app_hortifruti_pratico/app/data/models/user_login_response.dart';
import 'package:app_hortifruti_pratico/app/data/models/user_profile_request.dart';
import 'package:app_hortifruti_pratico/app/data/services/storage/service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';

class Api extends GetConnect {
  final _storageService = Get.find<StorageService>();

  @override
  void onInit() {
    httpClient.baseUrl = 'https://dev.hortifruti.174.138.42.25.getmoss.site/';
    httpClient.addRequestModifier((Request request) {
      request.headers['Accept'] = 'application/json';
      request.headers['Content-Type'] = 'application/json';

      return request;
    });

    httpClient.addAuthenticator((Request request) {
      final token = _storageService.token;
      final headers = {'Authorization': 'Bearer $token'};

      request.headers.addAll(headers);
      return request;
    });

    super.onInit();
  }

  Future<List<CityModel>> getCities() async {
    final response = _errorHandler(await get('cidades'));

    final List<CityModel> data = [];
    for (var city in response.body) {
      data.add(CityModel.fromJson(city));
    }
    return data;
  }

  Future<UserLoginResponseModel> login(UserLoginRequestModel data) async {
    final response = _errorHandler(await post('login', jsonEncode(data)));
    return UserLoginResponseModel.fromJson(response.body);
  }

  Future<UserModel> register(UserProfileRequestModel data) async {
    final response =
        _errorHandler(await post('cliente/cadastro', jsonEncode(data)));
    return UserModel.fromJson(response.body);
  }

  Future<UserModel> getUser() async {
    final response = _errorHandler(await get('auth/me'));
    return UserModel.fromJson(response.body);
  }

  Future<UserModel> putUser(UserProfileRequestModel data) async {
    final response = _errorHandler(await put('cliente', jsonEncode(data)));
    return UserModel.fromJson(response.body);
  }

  Future<List<AddressModel>> getUserAddresses() async {
    final response = _errorHandler(await get('enderecos'));

    final List<AddressModel> data = [];

    for (var address in response.body) {
      data.add(AddressModel.fromJson(address));
    }
    return data;
  }

  Future<void> postAddress(UserAddressRequestModel data) async {
    _errorHandler(await post('enderecos', jsonEncode(data)));
  }

  Future<void> putAddress(UserAddressRequestModel data) async {
    _errorHandler(await put('enderecos/${data.id}', jsonEncode(data)));
  }

  Future<void> deleteAddress(int id) async {
    _errorHandler(await delete('enderecos/$id'));
  }

  Future<List<StoreModel>> getStores(int cityId) async {
    final response =
        _errorHandler(await get('cidades/$cityId/estabelecimentos'));
    final List<StoreModel> data = [];

    for (var store in response.body) {
      data.add(StoreModel.fromJson(store));
    }
    return data;
  }

  Future<StoreModel> getStore(int id) async {
    final response = _errorHandler(await get('estabelecimentos/$id'));
    return StoreModel.fromJson(response.body);
  }

  Future<void> postOrder(OrderRequestModel data) async {
    _errorHandler(await post('pedidos', jsonEncode(data)));
  }

  Future<List<OrderModel>> getOrders() async {
    final response = _errorHandler(await get('pedidos'));
    final List<OrderModel> data = [];

    for (var order in response.body) {
      data.add(OrderModel.fromJson(order));
    }
    return data;
  }

  Future<OrderModel> getOrder(String id) async {
    final response = _errorHandler(await get('pedidos/$id'));
    return OrderModel.fromJson(response.body);
  }

  Response _errorHandler(Response response) {
    debugPrint(response.bodyString.toString());
    switch (response.statusCode) {
      case 200:
      case 202:
      case 204:
        return response;
      case 422:
        throw response.body['errors'].first['message'];
      default:
        throw 'Ocorreu um erro';
    }
  }
}
