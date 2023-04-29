import 'package:app_hortifruti_pratico/app/data/services/storage/service.dart';
import 'package:app_hortifruti_pratico/app/modules/cart/binding.dart';
import 'package:app_hortifruti_pratico/app/modules/cart/page.dart';
import 'package:app_hortifruti_pratico/app/modules/checkout/binding.dart';
import 'package:app_hortifruti_pratico/app/modules/checkout/page.dart';
import 'package:app_hortifruti_pratico/app/modules/dashboard/binding.dart';
import 'package:app_hortifruti_pratico/app/modules/dashboard/page.dart';
import 'package:app_hortifruti_pratico/app/modules/login/binding.dart';
import 'package:app_hortifruti_pratico/app/modules/login/page.dart';
import 'package:app_hortifruti_pratico/app/modules/order/binding.dart';
import 'package:app_hortifruti_pratico/app/modules/order/page.dart';
import 'package:app_hortifruti_pratico/app/modules/product/binding.dart';
import 'package:app_hortifruti_pratico/app/modules/product/page.dart';
import 'package:app_hortifruti_pratico/app/modules/register/bindin.dart';
import 'package:app_hortifruti_pratico/app/modules/register/page.dart';
import 'package:app_hortifruti_pratico/app/modules/select_city/binding.dart';
import 'package:app_hortifruti_pratico/app/modules/select_city/page.dart';
import 'package:app_hortifruti_pratico/app/modules/store/binding.dart';
import 'package:app_hortifruti_pratico/app/modules/store/page.dart';
import 'package:app_hortifruti_pratico/app/modules/user_addres_list/binding.dart';
import 'package:app_hortifruti_pratico/app/modules/user_addres_list/page.dart';
import 'package:app_hortifruti_pratico/app/modules/user_address/binding.dart';
import 'package:app_hortifruti_pratico/app/modules/user_address/page.dart';
import 'package:app_hortifruti_pratico/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.dashboard,
      page: () => const DashboardPage(),
      binding: DashboardBinding(),
      middlewares: [
        RedirectMiddleware(),
      ],
    ),
    GetPage(
      name: Routes.store,
      page: () => const StorePage(),
      binding: StoreBinding(),
    ),
    GetPage(
      name: Routes.product,
      page: () => const ProdutoPage(),
      binding: ProdutoBinding(),
    ),
    GetPage(
      name: Routes.cart,
      page: () => const CartPage(),
      binding: CartBinding(),
    ),
    GetPage(
      name: Routes.checkout,
      page: () => const CheckoutPage(),
      binding: CheckoutBinding(),
    ),
    GetPage(
      name: Routes.login,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.register,
      page: () => const RegisterPage(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: Routes.userAddress,
      page: () => const UserAddressPage(),
      binding: UserAddressBinding(),
    ),
    GetPage(
      name: Routes.userAddressList,
      page: () => const UserAddressListPage(),
      binding: UserAddressListBinding(),
    ),
    GetPage(
      name: Routes.order,
      page: () => const OrderPage(),
      binding: OrderBinding(),
    ),
    GetPage(
      name: Routes.selectCity,
      page: () => const SelectCityPage(),
      binding: SelectCityBinding(),
      fullscreenDialog: true,
    ),
  ];
}

class RedirectMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if (Get.find<StorageService>().cityId == null) {
      return const RouteSettings(name: Routes.selectCity);
    }

    return null;
  }
}
