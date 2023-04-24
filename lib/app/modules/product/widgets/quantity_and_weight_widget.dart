import 'package:app_hortifruti_pratico/app/modules/product/widgets/quantity_and_weight_controller.dart';
import 'package:app_hortifruti_pratico/app/modules/product/widgets/quantity_widget.dart';
import 'package:app_hortifruti_pratico/app/modules/product/widgets/weight_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuantityAndWeightWidget extends StatelessWidget {
  final bool isKg;

  const QuantityAndWeightWidget({
    Key? key,
    this.isKg = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuantityAndWeightController>(
      init: QuantityAndWeightController(isKg: isKg),
      builder: (controller) => Column(
        children: [
          QuantityWidget(),
          if (isKg) WeightWidget(),
        ],
      ),
    );
  }
}
