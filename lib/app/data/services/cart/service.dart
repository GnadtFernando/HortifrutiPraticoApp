import 'package:app_hortifruti_pratico/app/data/models/cart_product.dart';
import 'package:app_hortifruti_pratico/app/data/models/store.dart';
import 'package:get/get.dart';

class CartService extends GetxService {
  List<CartProductModel> products = RxList<CartProductModel>.empty();

  final store = Rxn<StoreModel>();
  final observacao = ''.obs;

  num get total => products.fold(
      0, (total, cartProductModel) => total + cartProductModel.total);

  void addProductToCart(CartProductModel cartProductModel) {
    products.add(cartProductModel);
  }

  void newCart(StoreModel newStore) {
    store.value = newStore;
  }

  bool isANewStore(StoreModel storeModel) {
    return store.value != null && store.value!.id != storeModel.id;
  }

  void clearCart() {
    products.clear();
  }

  void removeProductFromCart(CartProductModel cartProductModel) {
    products.remove(cartProductModel);
  }

  void finalizeCart() {
    clearCart();
    observacao.value = '';
  }
}
