import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/flight_text_form_field.dart';

class AddTripScreen extends ConsumerWidget {
  AddTripScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController(text: "city 1");
  final _descriptionController = TextEditingController(text: "City of light");
  final _locationController = TextEditingController(text: "Lagos");
  final _pictureController = TextEditingController(text: "sunshine.png");
  final List<String> pictures = [];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            FlightTextFormField(
              titleController: _titleController,
              labelText: 'title',
            ),
            FlightTextFormField(
              titleController: _descriptionController,
              labelText: 'description',
            ),
            FlightTextFormField(
              titleController: _locationController,
              labelText: 'location',
            ),
            FlightTextFormField(
              titleController: _pictureController,
              labelText: 'picture',
            ),
          ],
        ),
      ),
    );
  }
}
