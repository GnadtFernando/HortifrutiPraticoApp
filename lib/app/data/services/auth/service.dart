// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_hortifruti_pratico/app/data/models/user_login_request.dart';
import 'package:get/get.dart';

import 'package:app_hortifruti_pratico/app/data/services/auth/repository.dart';

class AuthService extends GetxService {
  AuthRepository _repository;
  AuthService(this._repository);

  Future login(UserLoginRequestModel userLoginRequest) {
    var data = _repository.login(userLoginRequest);
    return data;
  }
}
