import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;

  const InputField({
    Key key,
    this.hint,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 56,vertical: 4),
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: hint,
        ),
        keyboardType: TextInputType.number,
        controller: controller,
      ),
    );
  }
}
