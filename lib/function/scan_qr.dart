
import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../main.dart';

class ScanQr extends StatefulWidget {
  const ScanQr({super.key});

  @override
  State<ScanQr> createState() => _ScanQrState();
}

class _ScanQrState extends State<ScanQr> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(onPressed: scan_qr, child: const Text('Scan Qr')),
        Text(result)
      ],
    );
  }
  Future<void> scan_qr() async {
    try {
      ScanResult qrResult = await BarcodeScanner.scan();
      setState(() {
        result = qrResult.rawContent;
      });
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.cameraAccessDenied) {
        setState(() {
          result = 'Camera permission was denied';
        });
      } else {
        setState(() {
          result = 'Unknown Error $e';
        });
      }
    } on FormatException {
      setState(() {
        result = 'You pressed the back button before scaning anything';
      });
    } catch (e) {
      setState(() {
        result = 'Unknown Error $e';
      });
    }
  }
}