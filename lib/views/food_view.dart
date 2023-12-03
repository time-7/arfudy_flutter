import 'package:arfudy_flutter/controllers/food_view_controller.dart';
import 'package:arfudy_flutter/utils/arfudy_dialog.dart';
import 'package:arfudy_flutter/utils/extensions/string_extension.dart';
import 'package:arfudy_flutter/utils/new_ui_text.dart';
import 'package:arfudy_flutter/utils/ui_colors.dart';
import 'package:arfudy_flutter/views/widgets/new_primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/meal_model.dart';
import '../utils/ui_design.dart';
import '../utils/ui_scale.dart';
import 'widgets/arfudy_new_scaffold.dart';
import 'widgets/meal_container.dart';
import 'widgets/meal_info_container.dart';

class FoodView extends GetView<FoodViewController> {
  const FoodView({Key? key, required this.meal}) : super(key: key);
  final MealModel meal;

  @override
  Widget build(BuildContext context) {
    return ArfudyNewScaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            MealContainer(
              imageUrl: meal.imageUrl,
              name: meal.name,
            ),
            MealInfoContainer(
              title: 'Descrição',
              value: meal.description,
              isInRow: false,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MealInfoContainer(
                  title: 'Calorias',
                  value: "${meal.nutritionFacts.totalCalories} kcal",
                  isInRow: true,
                ),
                MealInfoContainer(
                  title: 'Preço',
                  value: meal.price.toStringAsFixed(2).toReal(),
                  isInRow: true,
                ),
              ],
            ),
            Container(
              width: UIScale.width(100),
              decoration: BoxDecoration(
                color: UIColors.primaryWhite,
                border: UIDesign.primaryBorder,
                borderRadius: const BorderRadius.all(
                  Radius.circular(40),
                ),
                boxShadow: UIDesign.primaryShadows,
              ),
              padding: EdgeInsets.symmetric(
                vertical: UIScale.height(1),
                horizontal: UIScale.width(8),
              ),
              margin: EdgeInsets.symmetric(vertical: UIScale.height(1)),
              child: Row(
                children: [
                  const NewUIText(
                    'Quantidade',
                    fontWeight: FontWeight.w500,
                    fontColor: UIColors.secondaryBlue,
                    fontSize: 20,
                  ),
                  const Spacer(),
                  Padding(
                    padding: EdgeInsets.only(right: UIScale.width(4)),
                    child: Obx(
                      () => IconButton(
                        onPressed: controller.quantity.value > 0
                            ? controller.decrement
                            : () {},
                        icon: const Icon(
                          Icons.remove,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Obx(
                    () => NewUIText(
                      controller.quantity.value.toString(),
                      fontWeight: FontWeight.w700,
                      fontColor: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: UIScale.width(4)),
                    child: IconButton(
                      onPressed: controller.increment,
                      icon: const Icon(
                        Icons.add,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Visibility(
              visible: meal.ingredients.isNotEmpty,
              child: MealInfoContainer(
                title: 'Ingredientes',
                value: meal.ingredients.map((e) => e.name).toList().join(', '),
                isInRow: false,
              ),
            ),
            SizedBox(height: UIScale.height(12))
          ],
        ),
      ),
      bottomBar: NewPrimaryButton(
        buttonText: 'Fazer pedido',
        isLoading: controller.isPosting,
        onPressed: () async {
          if (controller.clientRepository.currentClient.value == null) {
            ArfudyDialog.show(
              content: Column(
                children: [
                  const NewUIText(
                    'Inicie um atendimento para realizar pedidos',
                    softWrap: true,
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w500,
                  ),
                  const SizedBox(height: 30),
                  NewPrimaryButton.cancel(
                    buttonText: 'Ok',
                    onPressed: () {
                      Get.back();
                    },
                  ),
                ],
              ),
            );
            return;
          }
          if (controller.quantity.value == 0) {
            ArfudyDialog.show(
              content: Column(
                children: [
                  const NewUIText(
                    'Você precisa adicionar pelo menos 1 item para fazer o pedido',
                    softWrap: true,
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w500,
                  ),
                  const SizedBox(height: 30),
                  NewPrimaryButton.cancel(
                    buttonText: 'Ok',
                    onPressed: () {
                      Get.back();
                    },
                  ),
                ],
              ),
            );
          } else {
            if (await controller.postOrder(meal) ==
                'Pedido realizado com sucesso!') {
              ArfudyDialog.show(
                content: Column(
                  children: [
                    const NewUIText(
                      'Pedido realizado com sucesso!',
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      softWrap: true,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 15),
                    NewUIText(
                      'Detalhes do pedido:\n'
                      '\nItem: ${meal.name}'
                      '\nQuantidade: ${controller.quantity.value.toString()}'
                      '\nValor: ${(meal.price * controller.quantity.value).toString().toReal()}',
                    ),
                  ],
                ),
              );
            }
          }
          controller.quantity.value = 0;
        },
      ),
    );
  }
}
