import 'package:flutter/material.dart';

import '../../utils/ui_colors.dart';
import '../../utils/ui_scale.dart';

class MenuContainer extends StatelessWidget {
  const MenuContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: UIColors.primaryWhite,
        border: Border.all(
          color: Colors.black,
          width: 2,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(30),
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            blurRadius: 0,
            offset: Offset(0, 4),
          )
        ],
      ),
      width: UIScale.width(100),
      height: 128,
    );
  }
}
