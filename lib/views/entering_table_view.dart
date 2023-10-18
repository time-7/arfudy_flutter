import 'package:arfudy_flutter/utils/new_ui_text.dart';
import 'package:arfudy_flutter/utils/ui_design.dart';
import 'package:arfudy_flutter/views/widgets/arfudy_new_scaffold.dart';
import 'package:arfudy_flutter/views/widgets/new_primary_button.dart';
import 'package:arfudy_flutter/views/widgets/primary_text_field.dart';
import 'package:flutter/material.dart';

import '../utils/ui_colors.dart';
import '../utils/ui_scale.dart';

class EnteringTableView extends StatelessWidget {
  EnteringTableView({super.key});

  final TextEditingController _controller = TextEditingController();

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
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                decoration: BoxDecoration(
                  color: UIColors.tertiaryCaramel,
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  border: UIDesign.primaryBorder,
                  boxShadow: UIDesign.primaryShadows,
                ),
                width: UIScale.width(50),
                child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      NewUIText(
                        'Sua mesa é a número:',
                        textAlign: TextAlign.center,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        fontColor: UIColors.secondaryCaramel,
                      ),
                      Stack(
                        children: [
                          NewUIText(
                            '6',
                            textAlign: TextAlign.center,
                            fontSize: 64,
                            fontWeight: FontWeight.w500,
                            fontColor: UIColors.secondaryCaramel,
                            shadows: [
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
                      controller: _controller,
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
                  onPressed: () {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
