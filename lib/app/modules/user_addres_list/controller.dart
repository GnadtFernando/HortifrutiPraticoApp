import 'package:app_hortifruti_pratico/app/data/models/address.dart';
import 'package:app_hortifruti_pratico/app/modules/user_addres_list/repository.dart';
import 'package:app_hortifruti_pratico/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserAddressListController extends GetxController
    with StateMixin<List<AddressModel>> {
  final UserAddressListRepository _repository;
  UserAddressListController(this._repository);

  @override
  void onInit() async {
    await fetchAddresses();
    super.onInit();
  }

  Future<void> fetchAddresses() {
    return _repository.getUserAddresses().then((data) {
      change(data, status: RxStatus.success());
    }, onError: (error) {
      change(null, status: RxStatus.empty());
      change(null, status: RxStatus.error(error.toString()));
    });
  }

  void goToNewAddress() async {
    final result = await Get.toNamed(Routes.userAddress);
    if (result is bool && result) {
      await fetchAddresses();
    }
  }

  void goToEditAddress(AddressModel address) async {
    final result = await Get.toNamed(Routes.userAddress, arguments: address);
    if (result is bool && result) {
      await fetchAddresses();
    }
  }

  void deleteAddress(AddressModel address) {
    _repository.deleteAddress(address.id).then(
      (value) async {
        await fetchAddresses();
        ScaffoldMessenger.of(Get.overlayContext!).showSnackBar(
          const SnackBar(
            content: Text('O endereço foi excluido!'),
          ),
        );
      },
      onError: (error) => Get.dialog(
        AlertDialog(
          title: Text(
            error.toString(),
          ),
        ),
      ),
    );
  }
}
