import 'package:arfudy_flutter/views/widgets/new_primary_button.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

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
              onDetect: (capture) {
                final List<Barcode> barcodes = capture.barcodes;
                for (final barcode in barcodes) {
                  debugPrint('Barcode found! ${barcode.rawValue}');
                }
              },
            ),
          ),
          SizedBox(
            height: UIScale.height(100),
            width: UIScale.width(100),
            child: Column(mainAxisSize: MainAxisSize.max, children: [
              Container(
                height: UIScale.height(30),
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
                height: UIScale.width(80),
                width: UIScale.width(80),
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

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
}
