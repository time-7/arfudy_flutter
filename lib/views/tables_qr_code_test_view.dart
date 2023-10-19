import 'dart:convert';

import 'package:arfudy_flutter/utils/new_ui_text.dart';
import 'package:arfudy_flutter/utils/ui_design.dart';
import 'package:arfudy_flutter/views/widgets/arfudy_loading_failure_views.dart';
import 'package:arfudy_flutter/views/widgets/arfudy_new_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../controllers/tables_qr_code_test_view_controller.dart';
import '../utils/ui_scale.dart';

class TablesQrCodeTestView extends GetView<TablesQrCodeTestViewController> {
  const TablesQrCodeTestView({super.key});

  @override
  Widget build(BuildContext context) {
    return ArfudyNewScaffold(
      body: controller.obx(
        onLoading: const ArfudyLoadingView(),
        onError: (error) => ArfudyFailureView(
          error,
          onRetry: () {
            controller.getTablesService();
          },
        ),
        (state) => const _TablesQrCodeTestViewSuccess(),
      ),
    );
  }
}

class _TablesQrCodeTestViewSuccess extends GetView<TablesQrCodeTestViewController> {
  const _TablesQrCodeTestViewSuccess();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 16),
      itemCount: controller.tables.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(bottom: 200),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          width: UIScale.width(100),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            border: UIDesign.primaryBorder,
            boxShadow: UIDesign.primaryShadows,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NewUIText('Mesa ${controller.tables[index].tableNumber}'),
              QrImageView(
                data: json.encode(controller.tables[index]),
                size: 300,
              )
            ],
          ),
        ),
      ),
    );
  }
}
