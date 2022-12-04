import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_libary/function/create_qr.dart';
import 'package:qr_libary/function/save_qr.dart';
import 'package:qr_libary/function/scan_qr.dart';

void main(List<String> args) {
  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(routes:  <String, WidgetBuilder>{
    }, home:  Home());
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

String result = '';
GlobalKey globalKey = GlobalKey();

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        body: SafeArea(
          child: Column(
            //get vaule from user
            children: const [
              //  PhoneAuth()
              CreateQr(),
              SaveQr(),
              ScanQr(),
            ],
          ),
        ),
      ),
    );
  }
}
