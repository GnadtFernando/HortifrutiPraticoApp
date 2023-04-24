import 'package:app_hortifruti_pratico/app/data/models/cart_product.dart';
import 'package:app_hortifruti_pratico/app/data/models/store.dart';
import 'package:get/get.dart';

class CartService extends GetxService {
  List<CartProductModel> products = RxList<CartProductModel>.empty();

  final store = Rxn<StoreModel>();

  void addProductToCart(CartProductModel cartProductModel) {
    products.add(cartProductModel);
  }

  void newCart(StoreModel newStore) {
    store.value = newStore;
    products.clear();
  }

  void removeProductFromCart(CartProductModel cartProductModel) {
    products.remove(cartProductModel);
  }
}
