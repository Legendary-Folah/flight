import 'package:flutter/material.dart';

class FlightTextFormField extends StatelessWidget {
  const FlightTextFormField(
      {super.key,
        required TextEditingController titleController,
        required this.labelText})
      : _titleController = titleController;

  final TextEditingController _titleController;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _titleController,
      decoration: InputDecoration(
        labelText: labelText,
        contentPadding: const EdgeInsets.all(10.0),
      ),
    );
  }
}
