import 'package:flutter/material.dart';

import '../../utils/new_ui_text.dart';
import '../../utils/ui_colors.dart';

class PrimaryTextField extends StatefulWidget {
  const PrimaryTextField({
    super.key,
    this.hintText,
    required this.controller,
    this.onChanged,
    this.maxLines,
    this.minLines,
  });

  @override
  State<PrimaryTextField> createState() => _PrimaryTextFieldState();

  final String? hintText;
  final TextEditingController controller;
  final Function(String)? onChanged;
  final int? maxLines;
  final int? minLines;
}

class _PrimaryTextFieldState extends State<PrimaryTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.hintText != null)
          Column(
            children: [
              Container(
                alignment: Alignment.center,
                child: NewUIText(
                  widget.hintText ?? '',
                  fontColor: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [],
          ),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              decoration: BoxDecoration(
                color: UIColors.primaryWhite,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: Colors.black,
                  width: 2,
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 0,
                    offset: Offset(0, 4),
                  )
                ],
              ),
              child: TextFormField(
                maxLines: widget.maxLines,
                minLines: widget.minLines,
                onChanged: (value) {
                  if (widget.onChanged != null) widget.onChanged!(value);
                },
                controller: widget.controller,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: ArfudyFontFamily.montserrat.name,
                  fontSize: 18,
                ),
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  hintStyle: TextStyle(
                    fontFamily: ArfudyFontFamily.montserrat.name,
                    fontSize: 18,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 15.0,
                    horizontal: 20.0,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
