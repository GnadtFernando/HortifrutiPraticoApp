import 'package:app_hortifruti_pratico/app/modules/store/controller.dart';
import 'package:app_hortifruti_pratico/app/routes/routes.dart';
import 'package:app_hortifruti_pratico/app/widgets/store_status.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:transparent_image/transparent_image.dart';

class StorePage extends GetView<StoreController> {
  const StorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Obx(() {
        if (controller.showCartButton) {
          return FloatingActionButton(
            onPressed: () => Get.toNamed(Routes.cart),
            tooltip: 'Ver carrinho',
            child: const Icon(Icons.shopping_cart),
          );
        }
        return Container();
      }),
      body: controller.obx(
        (state) => CustomScrollView(
          slivers: [
            const SliverAppBar(),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                child: Row(
                  children: [
                    SizedBox(
                      width: 96.0,
                      height: 96.0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: FadeInImage.memoryNetwork(
                            placeholder: kTransparentImage,
                            image: state!.image),
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            state.nome,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Get.textTheme.headlineSmall,
                          ),
                          const SizedBox(height: 8.0),
                          StoreStatus(isOnline: state.isOnline),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: state.categorias.length,
                (context, index) {
                  final categoria = state.categorias[index];
                  return Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 16),
                              color: Colors.grey[200],
                              child: Text(
                                categoria.nome,
                                style: Get.textTheme.titleMedium!
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                      for (var produto in categoria.produtos)
                        ListTile(
                          title: Text(produto.nome),
                          subtitle: Text(
                            NumberFormat.simpleCurrency()
                                    .format(produto.preco) +
                                (produto.isKG ? '/kg' : ''),
                          ),
                          leading: produto.imagem.isNotEmpty
                              ? SizedBox(
                                  width: 56.0,
                                  height: 56.0,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: FadeInImage.memoryNetwork(
                                      placeholder: kTransparentImage,
                                      image:
                                          'https://loremflickr.com/300/300/food',
                                    ),
                                  ),
                                )
                              : null,
                          onTap: () => Get.toNamed(
                            Routes.product,
                            arguments: {
                              'product': produto,
                              'store': state,
                            },
                          ),
                        ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
