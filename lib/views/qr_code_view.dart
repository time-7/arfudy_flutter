import 'dart:convert';

import 'package:arfudy_flutter/views/widgets/new_primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../delegate/arfudy_views_routes.dart';
import '../models/active_table_model.dart';
import '../utils/new_ui_text.dart';
import '../utils/ui_colors.dart';
import '../utils/ui_scale.dart';

class QrCodeView extends StatefulWidget {
  const QrCodeView({super.key});

  @override
  State<QrCodeView> createState() => _QrCodeViewState();
}

class _QrCodeViewState extends State<QrCodeView> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  MobileScannerController controller = MobileScannerController(
    detectionSpeed: DetectionSpeed.normal,
    facing: CameraFacing.back,
    torchEnabled: true,
  );

  @override
  void initState() {
    controller.stop();
    super.initState();
  }

  bool _foundCode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColors.primaryBlue,
      body: Stack(
        children: [
          Positioned(
            child: MobileScanner(
              controller: controller,
              errorBuilder: (p0, p1, p2) {
                return const Center(
                  child: Text('Erro ao iniciar a câmera'),
                );
              },
              onDetect: (capture) async {
                final List<Barcode> barcodes = capture.barcodes;
                if (_foundCode) {
                  return;
                } else {
                  final barcode = barcodes[0];
                  debugPrint('Barcode found! ${barcode.rawValue}');
                  final table = _tryToConvertBarCode(barcode.rawValue);
                  if (table.runtimeType == ActiveTableModel) {
                    _foundCode = true;
                    Get.offAndToNamed(
                      ArfudyRoutes.enteringTable,
                      arguments: table,
                    );
                    _foundCode = false;
                  }
                }
              },
            ),
          ),
          SizedBox(
            height: UIScale.height(100),
            width: UIScale.width(100),
            child: Column(mainAxisSize: MainAxisSize.max, children: [
              Container(
                height: UIScale.height(25),
                width: UIScale.width(100),
                color: UIColors.primaryBlue,
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: SizedBox(
                    child: Image.asset(
                      'assets/images/arfudy_new_logo.png',
                      fit: BoxFit.contain,
                      width: UIScale.width(50),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: UIScale.width(100),
                width: UIScale.width(100),
              ),
              Expanded(
                child: Container(
                  color: UIColors.primaryBlue,
                  height: UIScale.height(30),
                  width: UIScale.height(100),
                  child: SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Column(
                        children: [
                          const NewUIText(
                            'Escaneie o QR Code para iniciar o seu atendimento!',
                            fontColor: Colors.white,
                            fontSize: 18,
                            textAlign: TextAlign.center,
                          ),
                          NewPrimaryButton(
                            buttonText: 'Voltar',
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  ActiveTableModel? _tryToConvertBarCode(String? barcode) {
    try {
      if (barcode != null) {
        Map<String, dynamic> map = json.decode(barcode);
        return ActiveTableModel.fromJson(map);
      }
      return null;
    } catch (e) {
      debugPrint('Error on convert barcode to json: $e');
      return null;
    }
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
}
