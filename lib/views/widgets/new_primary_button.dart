import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/new_ui_text.dart';
import '../../utils/ui_colors.dart';

class NewPrimaryButton extends StatefulWidget {
  const NewPrimaryButton({
    Key? key,
    required this.buttonText,
    this.onPressed,
    this.isLoading,
  }) : super(key: key);

  final String buttonText;
  final VoidCallback? onPressed;
  final RxBool? isLoading;

  @override
  State<NewPrimaryButton> createState() => _NewPrimaryButtonState();
}

class _NewPrimaryButtonState extends State<NewPrimaryButton> with SingleTickerProviderStateMixin {
  bool _isPressed = false;
  late AnimationController _animationController;
  double _textOpacity = 1;
  RxBool? _isLoading;

  @override
  void initState() {
    super.initState();
    widget.isLoading == null ? _isLoading = false.obs : _isLoading = widget.isLoading;
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
      value: 0,
      lowerBound: 0,
      upperBound: 0.72,
    );
  }

  _handlingReverse() {
    if (_animationController.value == 0) return;
    _animationController.reverse().then((value) => _textOpacity = 1).then((value) => setState(() {}));
  }

  _handlingFoward() {
    _textOpacity = 0;
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapUp: (details) => setState(() {
        _isPressed = false;
        if (widget.onPressed != null && !_isLoading!.value) {
          if (_isLoading!.value == false) widget.onPressed!();
          _animationController.forward();
        } else {
          _animationController.reverse();
        }
      }),
      onTapDown: (details) {
        if (!_isLoading!.value) {
          setState(() => _isPressed = true);
        }
      },
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, value) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 80),
            decoration: BoxDecoration(
              color: _isPressed == false ? UIColors.secondaryCaramel : UIColors.primaryWhite,
              borderRadius: const BorderRadius.all(
                Radius.circular(30),
              ),
              border: Border.all(
                color: Colors.black,
                width: 2,
              ),
            ),
            width: widget.isLoading == null ? 260 : 260 - (_animationController.value * 260),
            height: 62,
            child: Obx(() {
              _isLoading!.value == false ? _handlingReverse() : _handlingFoward();
              return Container(
                alignment: Alignment.center,
                child: _isLoading!.value
                    ? const CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : AnimatedOpacity(
                        duration: const Duration(milliseconds: 100),
                        opacity: _textOpacity,
                        child: NewUIText(
                          widget.buttonText,
                          textAlign: TextAlign.center,
                          fontColor: UIColors.tertiaryCaramel,
                          fontSize: widget.isLoading == null ? 18 : 18 - (_animationController.value * 18),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
              );
            }),
          );
        },
      ),
    );
  }
}
