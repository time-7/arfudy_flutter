import 'package:arfudy_flutter/models/meal_model.dart';
import 'package:arfudy_flutter/repositories/client_repository.dart';
import 'package:arfudy_flutter/services/error/exceptions.dart';
import 'package:arfudy_flutter/services/gateway.dart';
import 'package:arfudy_flutter/utils/arfudy_dialog.dart';
import 'package:arfudy_flutter/utils/new_ui_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/core_http_client.dart';

class FoodViewController extends GetxController {
  final quantity = 0.obs;
  final isPosting = false.obs;

  final _gateway = Get.find<IHttpClient>();
  final _clientRepository = Get.find<ClientRepository>();

  increment() {
    ++quantity.value;
  }

  decrement() {
    --quantity.value;
  }

  postOrder(MealModel meal) async {
    isPosting.value = true;
    await Future.delayed(const Duration(seconds: 2));
    try {
      final response = await GatewayHandler.call<String>(
        requisitionCallback: () => _gateway.post(
          '/orders',
          headers: {"clientToken": _clientRepository.currentClient.value.token},
          data: buildData(meal),
          isFormData: false,
        ),
        onSuccessCallback: (data) => data['message'],
        exception: PostOrderException(),
      );
      isPosting.value = false;
      return response;
    } catch (e) {
      debugPrint((e as NewCoreException).label);
      ArfudyDialog.show(
        content: const Column(
          children: [
            NewUIText(
              'Erro ao realizar pedido',
              softWrap: true,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(height: 20),
            NewUIText(
              'Verifique sua conexão com a internet e tente novamente',
              softWrap: true,
            )
          ],
        ),
      );
    }
    isPosting.value = false;
  }

  Map<String, Object> buildData(MealModel meal) {
    return {
      "serviceId": _clientRepository.service.value.id,
      "products": [
        {
          "id": meal.id,
          "name": meal.name,
          "quantity": quantity.value,
        }
      ]
    };
  }
}
