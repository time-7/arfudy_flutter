import 'package:arfudy_flutter/utils/new_ui_text.dart';
import 'package:arfudy_flutter/utils/ui_design.dart';
import 'package:arfudy_flutter/views/widgets/arfudy_new_scaffold.dart';
import 'package:arfudy_flutter/views/widgets/new_primary_button.dart';
import 'package:arfudy_flutter/views/widgets/primary_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../controllers/entering_table_view_controller.dart';
import '../utils/ui_colors.dart';
import '../utils/ui_scale.dart';

class EnteringTableView extends GetView<EnteringTableViewController> {
  const EnteringTableView({super.key});

  @override
  Widget build(BuildContext context) {
    return ArfudyNewScaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                decoration: BoxDecoration(
                  color: UIColors.tertiaryCaramel,
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  border: UIDesign.primaryBorder,
                  boxShadow: UIDesign.primaryShadows,
                ),
                width: UIScale.width(50),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const NewUIText(
                        'Sua mesa é a número:',
                        textAlign: TextAlign.center,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        fontColor: UIColors.secondaryCaramel,
                      ),
                      Stack(
                        children: [
                          NewUIText(
                            controller.table.tableNumber.toString(),
                            textAlign: TextAlign.center,
                            fontSize: 64,
                            fontWeight: FontWeight.w500,
                            fontColor: UIColors.secondaryCaramel,
                            shadows: const [
                              BoxShadow(
                                color: Colors.black,
                                blurRadius: 0,
                                offset: Offset(0, 4),
                              ),
                              BoxShadow(
                                color: Colors.black,
                                blurRadius: 0,
                                offset: Offset(0, -2),
                              ),
                              BoxShadow(
                                color: Colors.black,
                                blurRadius: 0,
                                offset: Offset(2, 0),
                              ),
                              BoxShadow(
                                color: Colors.black,
                                blurRadius: 0,
                                offset: Offset(-2, 0),
                              )
                            ],
                          ),
                        ],
                      ),
                    ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Column(
                  children: [
                    PrimaryTextField(
                      controller: controller.nameController,
                      hintText: 'Insira seu nome completo:',
                      textInputAction: TextInputAction.go,
                      keyboardType: TextInputType.name,
                      textCapitalization: TextCapitalization.words,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: NewPrimaryButton(
                  buttonText: 'Continuar',
                  onPressed: controller.initService,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
