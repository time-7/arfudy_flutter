import 'package:flutter/material.dart';

import '../../utils/new_ui_text.dart';
import '../../utils/ui_colors.dart';
import '../../utils/ui_design.dart';

class PrimaryTextField extends StatefulWidget {
  const PrimaryTextField({
    super.key,
    this.hintText,
    required this.controller,
    this.onChanged,
    this.maxLines,
    this.minLines,
    this.textInputAction,
    this.onSubmitted,
    this.keyboardType,
    this.textCapitalization = TextCapitalization.none,
  });

  @override
  State<PrimaryTextField> createState() => _PrimaryTextFieldState();

  final String? hintText;
  final TextEditingController controller;
  final Function(String)? onChanged;
  final int? maxLines;
  final int? minLines;
  final TextInputAction? textInputAction;
  final Function(String)? onSubmitted;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
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
          ),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              decoration: BoxDecoration(
                color: UIColors.primaryWhite,
                borderRadius: BorderRadius.circular(15),
                border: UIDesign.primaryBorder,
                boxShadow: UIDesign.primaryShadows,
              ),
              child: TextFormField(
                keyboardType: widget.keyboardType,
                textCapitalization: widget.textCapitalization,
                onFieldSubmitted: widget.onSubmitted,
                textInputAction: widget.textInputAction,
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
