import 'package:flutter/material.dart';

import '../../utils/new_ui_text.dart';
import '../../utils/ui_colors.dart';
import '../../utils/ui_scale.dart';

class PersonOrdersContainer extends StatefulWidget {
  const PersonOrdersContainer({
    super.key,
    this.items = const [],
    required this.name,
  });

  final List<String> items;
  final String name;

  @override
  State<PersonOrdersContainer> createState() => _PersonOrdersContainerState();
}

class _PersonOrdersContainerState extends State<PersonOrdersContainer> {
  bool _isOpened = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedOpacity(
          opacity: _isOpened == false ? 0 : 1,
          duration: const Duration(milliseconds: 80),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            curve: Curves.bounceInOut,
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 7,
            ),
            height: _isOpened == false ? 38 : 38 + (22 * widget.items.length) + 38,
            width: UIScale.width(100),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.black,
                width: 1,
                strokeAlign: BorderSide.strokeAlignOutside,
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
            child: Padding(
              padding: const EdgeInsets.only(top: 38),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (var item in widget.items)
                      NewUIText(
                        item,
                        fontSize: 16,
                      )
                  ],
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            _isOpened = !_isOpened;
            setState(() {});
          },
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 7,
            ),
            height: 38,
            width: UIScale.width(100),
            decoration: BoxDecoration(
              color: UIColors.secondaryCaramel,
              border: Border.all(
                color: Colors.black,
                width: 1,
                strokeAlign: BorderSide.strokeAlignOutside,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NewUIText(
                  widget.name,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  fontColor: UIColors.tertiaryCaramel,
                ),
                AnimatedRotation(
                  turns: _isOpened == false ? 0 : 1 / 4,
                  duration: const Duration(milliseconds: 100),
                  child: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: UIColors.tertiaryCaramel,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
