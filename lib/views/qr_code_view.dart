import 'package:arfudy_flutter/utils/ui_scale.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QrCodeView extends StatefulWidget {
  const QrCodeView({super.key});

  @override
  State<QrCodeView> createState() => _QrCodeViewState();
}

class _QrCodeViewState extends State<QrCodeView> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void reassemble() {
    super.reassemble();
  }

  @override
  Widget build(BuildContext context) {
    UIScale.init(context);
    return Scaffold(
      body: Column(children: [
        SizedBox(
          height: UIScale.deviceTopPadding,
        ),
        Expanded(
          flex: 1,
          child: Container(),
        ),
        Expanded(
          flex: 6,
          child: MobileScanner(
            onDetect: (capture) {
              final List<Barcode> barcodes = capture.barcodes;
              for (final barcode in barcodes) {
                debugPrint('Barcode found! ${barcode.rawValue}');
              }
            },
          ),
        )
      ]),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
