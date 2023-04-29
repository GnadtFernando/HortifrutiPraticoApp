import 'package:app_hortifruti_pratico/app/modules/user_addres_list/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserAddressListPage extends GetView<UserAddressListController> {
  const UserAddressListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Meus Endereços')),
      body: controller.obx(
        (state) => SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 16,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: controller.goToNewAddress,
                        icon: const Icon(Icons.add_location),
                        label: const Text('Novo endereço '),
                      ),
                    ),
                  ],
                ),
              ),
              for (var address in state!)
                ListTile(
                  title: Text(
                    '${address.street}, n* ${address.number}',
                  ),
                  subtitle: Text(
                    '${address.neighborhood}, ${address.city!.name}',
                  ),
                  trailing: PopupMenuButton(
                    itemBuilder: (context) => [
                      const PopupMenuItem(
                        value: 'edit',
                        child: Text('Editar'),
                      ),
                      const PopupMenuItem(
                        value: 'delete',
                        child: Text('Excluir'),
                      ),
                    ],
                    onSelected: (value) {
                      switch (value) {
                        case 'delete':
                          controller.deleteAddress(address);
                          break;
                        case 'edit':
                          controller.goToEditAddress(address);
                          break;
                        default:
                      }
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
