import 'package:flutter/material.dart';

import '../../utils/new_ui_text.dart';
import '../../utils/ui_colors.dart';

class NewPrimaryButton extends StatelessWidget {
  const NewPrimaryButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
      width: 260,
      height: 62,
      child: Container(
        alignment: Alignment.center,
        child: const NewUIText(
          'Iniciar atendimento',
          fontColor: UIColors.tertiaryCaramel,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
