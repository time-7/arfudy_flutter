import 'package:flutter/material.dart';

import '../../../utils/ui_colors.dart';

class CallWaitressButton extends StatelessWidget {
  const CallWaitressButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
