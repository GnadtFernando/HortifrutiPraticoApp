import 'package:app_hortifruti_pratico/app/modules/product/widgets/quantity_and_weight_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class QuantityWidget extends StatelessWidget {
  QuantityWidget({super.key});
  final controller = Get.find<QuantityAndWeightController>();

  @override
  Widget build(BuildContext context) {
    var quantidade = controller.quantity;
    var isKg = controller.isKg;
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: quantidade > 1
              ? () => controller.changeQuantity(quantidade - 1)
              : null,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(0),
            minimumSize: const Size(40, 40),
          ),
          child: const Icon(Icons.remove),
        ),
        Container(
          width: isKg ? 96 : 48,
          padding: const EdgeInsets.all(8),
          child: Align(
            child: Text(
              NumberFormat.decimalPattern().format(quantidade) +
                  (isKg ? 'kg' : ''),
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () => controller.changeQuantity(quantidade + 1),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(0),
            minimumSize: const Size(40, 40),
          ),
          child: const Icon(Icons.add),
        ),
      ],
    );
  }
}
