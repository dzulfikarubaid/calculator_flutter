import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cal_provider.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key, required this.controller
  });
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
      final provider = Provider.of<CalculatorProvider>(context, listen: false);

    return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    child: TextField(
      controller: controller,
      scrollController: provider.scrollController,
      decoration: const InputDecoration(
        border: InputBorder.none,
      ),
      style: const TextStyle(fontSize: 50),
      readOnly: true,
      autofocus: true,
      showCursor: true,

    ),
          );
  }
}