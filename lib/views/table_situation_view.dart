import 'package:arfudy_flutter/controllers/table_situation_view_controller.dart';
import 'package:arfudy_flutter/utils/new_ui_text.dart';
import 'package:arfudy_flutter/views/widgets/arfudy_new_scaffold.dart';
import 'package:arfudy_flutter/views/widgets/buttons/call_waitress_button.dart';
import 'package:arfudy_flutter/views/widgets/center_text.dart';
import 'package:arfudy_flutter/views/widgets/new_primary_button.dart';
import 'package:arfudy_flutter/views/widgets/person_orders_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/arfudy_dialog.dart';
import '../utils/ui_colors.dart';
import '../utils/ui_scale.dart';

class TableSituationView extends GetView<TableSituationViewController> {
  const TableSituationView({super.key});

  @override
  Widget build(BuildContext context) {
    return ArfudyNewScaffold(
      hasDrawer: true,
      body: RefreshIndicator(
        onRefresh: () => controller.getOrders(),
        child: controller.obx(
          (orders) {
            final clients = orders?.keys.toList();
            return Padding(
              padding: EdgeInsets.symmetric(vertical: UIScale.height(4)),
              child: ListView.builder(
                itemCount: clients?.length,
                itemBuilder: (contex, index) => Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: PersonOrdersContainer(
                    name: clients![index],
                    items: orders![clients[index]]!
                        .map((e) => e.toStringTableSituation())
                        .toList(),
                  ),
                ),
              ),
            );
          },
          onEmpty: const CenterText(
            'Nenhum pedido para essa mesa!'
            '\n\nVolte ao cardápio e faça seu pedido!',
          ),
        ),
      ),
      bottomBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          NewPrimaryButton(
            buttonText: 'Finalizar atendimento',
            isLoading: controller.isEndingService,
            onPressed: () async {
              if (controller.clientRepository.currentClient.value!.isAdmin &&
                  controller.clientRepository.service.value!.clients.length >
                      1) {
                ArfudyDialog.show(content: const _EndServiceDialog());
              } else {
                ArfudyDialog.show(
                  content: Column(
                    children: [
                      const NewUIText(
                        'Tem certeza que deseja finalizar esse atendimento?',
                        fontColor: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        textAlign: TextAlign.center,
                        softWrap: true,
                      ),
                      const SizedBox(height: 26),
                      NewPrimaryButton.minimal(
                        buttonText: 'Sim',
                        onPressed: () => controller.endService(),
                        backgroundColor: UIColors.secondaryBlue,
                      ),
                      const SizedBox(height: 30),
                      NewPrimaryButton.cancel(
                        onPressed: () {
                          Get.back();
                        },
                      ),
                    ],
                  ),
                );
              }
            },
          ),
          const CallWaitressButton(),
        ],
      ),
    );
  }
}

class _EndServiceDialog extends StatelessWidget {
  const _EndServiceDialog();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const NewUIText(
          'Qual atendimento deseja finalizar?',
          fontColor: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.w500,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 26),
        const NewPrimaryButton.minimal(
          buttonText: 'Apenas o meu',
          onPressed: null,
          backgroundColor: UIColors.secondaryBlue,
        ),
        const SizedBox(height: 15),
        const NewPrimaryButton.minimal(
          buttonText: 'Encerrar mesa',
          onPressed: null,
        ),
        const SizedBox(height: 30),
        NewPrimaryButton.cancel(
          onPressed: () {
            Get.back();
          },
        ),
      ],
    );
  }
}
