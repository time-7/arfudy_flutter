import 'dart:ui';

import 'package:arfudy_flutter/utils/ui_colors.dart';
import 'package:arfudy_flutter/utils/ui_design.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArfudyDialog {
  static Future<T?> show<T>({Widget? content}) {
    return Get.dialog(
      BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Material(
          type: MaterialType.transparency,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(30),
                margin: const EdgeInsets.symmetric(horizontal: 42),
                decoration: BoxDecoration(
                  color: UIColors.secondaryCaramel,
                  border: UIDesign.primaryBorder,
                  boxShadow: UIDesign.primaryShadows,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                child: content,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
