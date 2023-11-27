import 'package:flutter/material.dart';

import '../../../utils/ui_colors.dart';

class NewIconButton extends StatelessWidget {
  const NewIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  final IconData icon;
  final VoidCallback onPressed;

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
      child: IconButton(
        icon: Icon(
          icon,
          color: Colors.black,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
