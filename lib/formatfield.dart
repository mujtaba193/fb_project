import 'package:flutter/material.dart';

class CostomTextt1 extends StatelessWidget {
  const CostomTextt1({
    Key? key,
    required this.mycontroller,
    required this.hintText,
  }) : super(key: key);
  final TextEditingController mycontroller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: mycontroller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: 14,
        ),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      onChanged: (value) {},
    );
  }
}
