import 'package:app_hortifruti_pratico/app/data/services/auth/service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserAddressController extends GetxController {
  final _authService = Get.find<AuthService>();
  final streetController = TextEditingController(text: '');
  final numberController = TextEditingController(text: '');
  final neighborhoodController = TextEditingController(text: '');
  final referencePointController = TextEditingController(text: '');
  final complementController = TextEditingController(text: '');
  void submit() {}
}
