import 'package:flutter/material.dart';

import '../../utils/ui_colors.dart';
import '../../utils/ui_scale.dart';

class ARButton extends StatelessWidget {
  const ARButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(UIScale.width(1.3)),
      alignment: Alignment.center,
      height: UIScale.height(4.6),
      width: UIScale.height(4.6),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Center(
        child: Icon(
          Icons.view_in_ar,
          color: UIColors.offWhite,
          size: UIScale.height(2.3),
        ),
      ),
    );
  }
}
