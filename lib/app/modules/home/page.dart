import 'package:app_hortifruti_pratico/app/modules/home/controller.dart';
import 'package:app_hortifruti_pratico/app/routes/routes.dart';
import 'package:app_hortifruti_pratico/app/widgets/store_status.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transparent_image/transparent_image.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hortifruti Prático'),
        actions: [
          IconButton(
            onPressed: () => Get.toNamed(Routes.selectCity),
            icon: const Icon(Icons.location_pin),
            tooltip: 'Alterar cidade',
          )
        ],
      ),
      body: controller.obx(
        (state) => ListView(
          children: [
            for (var store in state!)
              ListTile(
                title: Text(store.nome),
                leading: SizedBox(
                  width: 56.0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage, image: store.image),
                  ),
                ),
                trailing: StoreStatus(
                  isOnline: store.isOnline,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 16,
                ),
                onTap: () => Get.toNamed(
                  Routes.store.replaceFirst(
                    ':id',
                    store.id.toString(),
                  ),
                ),
              )
          ],
        ),
        onEmpty: const Center(
          child: Text(
              'Não tem nenhum estabelecimento disponível para a sua cidade.'),
        ),
      ),
    );
  }
}
