import 'package:flutter/material.dart';
import 'package:qr_libary/common/TextFormFile.dart';
TextEditingController _description_controller = TextEditingController();
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const SizedBox(height: 15),
          TextFormFile_Widget(HintText: 'Desciption Book', TextLable: 'Enter Desciption Book', controller: _description_controller),
        ],
      ),
    );
}
}
