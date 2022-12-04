// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TextFormFile_Widget extends StatelessWidget {
  String HintText, TextLable;
  TextEditingController controller;
  TextFormFile_Widget({
    super.key,
    required this.HintText,
    required this.TextLable,
    required this.controller
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: HintText,
        labelText: TextLable,
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: const BorderSide(color: Colors.blue)),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Colors.green))
      ),
    );
  }
}
