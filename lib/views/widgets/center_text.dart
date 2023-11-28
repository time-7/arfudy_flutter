import 'package:arfudy_flutter/utils/ui_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/new_ui_text.dart';

class CenterText extends StatelessWidget {
  const CenterText(
    this.text, {
    Key? key,
  }) : super(key: key);

  final String text;

  static const empty = CenterText('Não conseguimos encontar nenhum item');
  static const error = CenterText('Ocorreu um erro ao buscar dados');

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(bottom: Get.height * 0.2),
        child: NewUIText(
          text,
          fontColor: UIColors.primaryWhite,
          fontSize: 20,
          softWrap: true,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
