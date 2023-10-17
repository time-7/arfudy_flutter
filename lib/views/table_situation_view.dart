import 'package:arfudy_flutter/utils/new_ui_text.dart';
import 'package:arfudy_flutter/views/widgets/arfudy_new_scaffold.dart';
import 'package:arfudy_flutter/views/widgets/new_primary_button.dart';
import 'package:arfudy_flutter/views/widgets/person_orders_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/arfudy_dialog.dart';
import '../utils/ui_colors.dart';
import '../utils/ui_scale.dart';

class TableSituationView extends StatelessWidget {
  const TableSituationView({super.key});

  @override
  Widget build(BuildContext context) {
    return ArfudyNewScaffold(
      hasDrawer: true,
      body:  SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(
                height: 16,
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 30),
                child: PersonOrdersContainer(name: 'Felippe', items: [
                  '3x macarrão enjoado',
                ]),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 30),
                child: PersonOrdersContainer(
                  name: 'Marcos',
                  items: [
                    '3x macarrão enjoado',
                    '1x macarrão enjoado',
                    '1x macarrão enjoado',
                    '1x macarrão enjoado',
                    '1x macarrão enjoado',
                    '1x macarrão enjoado',
                    '1x macarrão enjoado',
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 30),
                child: PersonOrdersContainer(
                  name: 'Daniel',
                  items: [
                    '3x macarrão enjoado',
                    '1x macarrão enjoado',
                    '1x macarrão enjoado',
                    '1x macarrão enjoado',
                    '1x macarrão enjoado',
                    '1x macarrão enjoado',
                    '1x macarrão enjoado',
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 30),
                child: PersonOrdersContainer(
                  name: 'Isabela',
                  items: [
                    '3x macarrão enjoado',
                    '1x macarrão enjoado',
                    '1x macarrão enjoado',
                    '1x macarrão enjoado',
                    '1x macarrão enjoado',
                    '1x macarrão enjoado',
                    '1x macarrão enjoado',
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 30),
                child: PersonOrdersContainer(
                  name: 'Steven',
                  items: [
                    '3x macarrão enjoado',
                    '1x macarrão enjoado',
                    '1x macarrão enjoado',
                    '1x macarrão enjoado',
                    '1x macarrão enjoado',
                    '1x macarrão enjoado',
                    '1x macarrão enjoado',
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 30),
                child: PersonOrdersContainer(
                  name: 'Gabriel',
                  items: [
                    '3x macarrão enjoado',
                    '1x macarrão enjoado',
                    '1x macarrão enjoado',
                    '1x macarrão enjoado',
                    '1x macarrão enjoado',
                    '1x macarrão enjoado',
                    '1x macarrão enjoado',
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 30),
                child: PersonOrdersContainer(
                  name: 'Julia',
                  items: [
                    '3x macarrão enjoado',
                    '1x macarrão enjoado',
                    '1x macarrão enjoado',
                    '1x macarrão enjoado',
                    '1x macarrão enjoado',
                    '1x macarrão enjoado',
                    '1x macarrão enjoado',
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 30),
                child: PersonOrdersContainer(
                  name: 'Adrian',
                  items: [
                    '3x macarrão enjoado',
                    '1x macarrão enjoado',
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 30),
                child: PersonOrdersContainer(
                  name: 'João',
                  items: [],
                ),
              ),
              SizedBox(height: UIScale.height(10) + UIScale.bottomDevicePadding),
            ],
          ),
        ),
      ),
      bottomBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          NewPrimaryButton(
            buttonText: 'Finalizar atendimento',
            onPressed: () async {
              ArfudyDialog.show(content: const _EndServiceDialog());
            },
          ),
          Container(
            height: 62,
            width: 62,
            decoration: BoxDecoration(
              color: UIColors.secondaryCaramel,
              borderRadius: const BorderRadius.all(
                Radius.circular(30),
              ),
              border: Border.all(
                color: Colors.black,
                width: 2,
              ),
            ),
            child: const Icon(
              Icons.room_service,
              color: UIColors.tertiaryCaramel,
              size: 32,
            ),
          )
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
