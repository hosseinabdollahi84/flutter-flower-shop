import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class Camerapage extends StatefulWidget {
  const Camerapage({super.key});

  @override
  State<Camerapage> createState() => _CamerapageState();
}

class _CamerapageState extends State<Camerapage> {
  MobileScannerController cameraContoroler = MobileScannerController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('اسکن کد')),
      body: MobileScanner(
        controller: cameraContoroler,
        onDetect: (capture) {
          final List<Barcode> barcodes = capture.barcodes;
        },
      ),
    );
  }
}
