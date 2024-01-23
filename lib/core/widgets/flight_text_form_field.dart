import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FlightTextFormField extends StatelessWidget {
  const FlightTextFormField(
      {super.key,
        this.keyboardType,
        this.textInputFormatter,
        required TextEditingController titleController,
        required this.labelText})
      : _titleController = titleController;

  final List<TextInputFormatter>? textInputFormatter;
  final TextInputType? keyboardType;
  final TextEditingController _titleController;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextFormField(
        controller: _titleController,
        inputFormatters: textInputFormatter,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: labelText,
          contentPadding: const EdgeInsets.all(10.0),
        ),
      ),
    );
  }
}
