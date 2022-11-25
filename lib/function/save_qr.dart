import 'dart:io' as io;
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:image_downloader_web/image_downloader_web.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_libary/function/create_qr.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import '../main.dart';
import './external_path.dart';

class SaveQr extends StatefulWidget {
  const SaveQr({super.key});

  @override
  State<SaveQr> createState() => _SaveQrState();
}

final WebImageDownloader _webImageDownloader = WebImageDownloader();

class _SaveQrState extends State<SaveQr> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: kIsWeb ? _captureAndSavePngWeb : _captureAndSavePngAndroid,
        child: const Text('Save'));
  } // NOT running on the web! You can check for additional platforms here.

  @override
  void initState() {
    super.initState();
    _captureAndSavePngAndroid();
  }

  //Mobile
  Future<void> _captureAndSavePngAndroid() async {
// You can request multiple permissions at once.
    Map<Permission, PermissionStatus> statuses = await [
      Permission.manageExternalStorage,
      Permission.storage,
    ].request();
    print(statuses[Permission.storage]);
    final RenderRepaintBoundary? boundary =
        globalKey.currentContext?.findRenderObject() as RenderRepaintBoundary?;
    var image = await boundary?.toImage();
    ByteData? byteData =
        await image?.toByteData(format: ui.ImageByteFormat.png);
    Uint8List? pngBytes = byteData?.buffer.asUint8List();
    // io.Directory tempDir = (await getExternalStorageDirectories(type: StorageDirectory.downloads))!.first;
    const folderName = 'Libary School';
    final path = io.Directory('/storage/emulated/0/$folderName');
    if (await path.exists()) {
      print('exists');
    } else {
      print('non exists');
      path.create();
    }
    var tempDir = await ExternalPath.getExternalStoragePublicDirectory(
        ExternalPath.DIRECTORY_LIBARY_SCHOOL);
    print("tempDir: $tempDir");
    final qrcodeFile = await io.File(
            '$tempDir/${s_controller.toString().replaceAll('https://', 'www.').replaceAll('/', '.')}.png')
        .create(recursive: true);
    await qrcodeFile.writeAsBytes(pngBytes!);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Saved $tempDir'),));
  }
}

//Web
Future<void> _captureAndSavePngWeb() async {
  final RenderRepaintBoundary? boundary =
      globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary?;
  var image = await boundary!.toImage();
  ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
  Uint8List pngBytes = byteData!.buffer.asUint8List();
  // io.Directory tempDir = (await getExternalStorageDirectories(type: StorageDirectory.downloads))!.first;
  // print(tempDir);
  // String qrcodeFile = '${s_controller.toString().replaceAll('https://', 'www.').replaceAll('/', '.')}.png';
  _webImageDownloader.downloadImageFromUInt8List(
      uInt8List: pngBytes,
      name:
          '${s_controller.toString().replaceAll('https://', 'www.').replaceAll('/', '.')}.png');
  // print(qrcodeFile);
}
