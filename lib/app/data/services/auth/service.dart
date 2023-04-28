// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_hortifruti_pratico/app/data/models/user.dart';
import 'package:app_hortifruti_pratico/app/data/models/user_login_request.dart';
import 'package:app_hortifruti_pratico/app/data/services/storage/service.dart';
import 'package:get/get.dart';

import 'package:app_hortifruti_pratico/app/data/services/auth/repository.dart';

class AuthService extends GetxService {
  final _storageService = Get.find<StorageService>();
  final AuthRepository _repository;
  AuthService(this._repository);
  final user = Rxn<UserModel>();
  bool get isLogged => user.value != null;

  @override
  void onInit() async {
    await _getUser();
    super.onInit();
  }

  Future<void> login(UserLoginRequestModel userLoginRequest) async {
    final userLoginResponse = await _repository.login(userLoginRequest);
    await _storageService.saveToken(userLoginResponse.token);
    await _getUser();
  }

  Future<void> logout() async {
    await _storageService.removeToken();
    user.value = null;
  }

  Future _getUser() {
    return _repository.getUser().then((value) {
      user.value = value;
    });
  }
}
