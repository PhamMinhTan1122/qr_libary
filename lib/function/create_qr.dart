// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../main.dart';

class CreateQr extends StatefulWidget {
  const CreateQr({super.key});

  @override
  State<CreateQr> createState() => _CreateQrState();
}

TextEditingController _data_controller = TextEditingController();
String s_controller = '';

class _CreateQrState extends State<CreateQr> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children:[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: _data_controller,
          ),
        ),
        // create_qr(),
        if(_data_controller.text.isNotEmpty)
          create_qr(), 
        ElevatedButton(
            onPressed: () {
              if (_data_controller.text.isEmpty) {
                setState(() {
                  s_controller = '';
                });
              } else {
                create_qr();
                setState(() {
                  s_controller = _data_controller.text;
                });
              }
            },
            child: const Text('Create Qr')),
      ],
    );
  }

  RepaintBoundary create_qr() {
    return RepaintBoundary(
      key: globalKey,
      child: QrImage(
        data: s_controller,
        version: QrVersions.auto,
      errorCorrectionLevel: QrErrorCorrectLevel.Q,
        gapless: false,
        size: 200,
        backgroundColor: Colors.white,
      ),
    );
  }
}
