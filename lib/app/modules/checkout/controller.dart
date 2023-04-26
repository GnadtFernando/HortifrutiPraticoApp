import 'package:app_hortifruti_pratico/app/data/models/address.dart';
import 'package:app_hortifruti_pratico/app/data/models/payment_method.dart';
import 'package:app_hortifruti_pratico/app/data/models/shipping_by_city.dart';
import 'package:app_hortifruti_pratico/app/data/services/auth/service.dart';
import 'package:app_hortifruti_pratico/app/data/services/cart/service.dart';
import 'package:app_hortifruti_pratico/app/modules/checkout/repository.dart';
import 'package:app_hortifruti_pratico/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  final CheckoutRepository _repository;
  final _cartSerice = Get.find<CartService>();
  final _authService = Get.find<AuthService>();

  CheckoutController(this._repository);
  final loading = true.obs;
  num get totalCart => _cartSerice.total;
  num get deliveryCost {
    if (getShippingByCity != null) {
      return getShippingByCity!.cost;
    }
    return 0;
  }

  ShippingByCityModel? get getShippingByCity {
    if (addressSelected.value == null) {
      return null;
    }

    return _cartSerice.store.value!.shippingByCity.firstWhereOrNull(
        (shippingByCity) =>
            shippingByCity.id == addressSelected.value!.city!.id);
  }

  num get totalOrder => totalCart + deliveryCost;
  List<PaymentMethodModel> get paymentMethods =>
      _cartSerice.store.value!.paymentMethods;
  final paymentMethod = Rxn<PaymentMethodModel>();
  bool get isLogged => _authService.isLogged;
  final addresses = RxList<AddressModel>.empty();
  final addressSelected = Rxn<AddressModel>();
  bool get deliveryToMyAddress => getShippingByCity != null;

  @override
  void onInit() {
    fetchAdrresses();
    super.onInit();
  }

  void changePaymentMethod(PaymentMethodModel? newPaymentMethod) {
    paymentMethod.value = newPaymentMethod;
  }

  void goToLogin() {
    Get.toNamed(Routes.login);
  }

  void goToNewAddress() {
    Get.toNamed(Routes.userAddress);
  }

  void fetchAdrresses() {
    _repository.getUserAddresses().then((value) {
      addresses.addAll(value);

      if (addresses.isNotEmpty) {
        addressSelected.value = addresses.first;
      }
      loading(false);
    }, onError: (error) {
      loading(false);
    });
  }

  void showAddressList() {
    Get.dialog(
      SimpleDialog(
        title: const Text('Selecione um endereço'),
        children: [
          for (var address in addresses)
            SimpleDialogOption(
              onPressed: () {
                addressSelected.value = address;
                Get.back();
              },
              child: Text(
                  '${address.street}, n* ${address.number}, ${address.neighborhood}'),
            ),
          TextButton(
            onPressed: () {
              Get.back();
              goToNewAddress();
            },
            child: const Text('Cadastrar um endereço'),
          )
        ],
      ),
    );
  }
}
