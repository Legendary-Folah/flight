import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hotel_ui/core/colors/colors.dart';

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
            const SizedBox(
              height: 10,
            ),
            FlightTextFormField(
              titleController: _descriptionController,
              labelText: 'description',
            ),
            const SizedBox(
              height: 10,
            ),
            FlightTextFormField(
              titleController: _locationController,
              labelText: 'location',
            ),
            const SizedBox(
              height: 10,
            ),
            FlightTextFormField(
              titleController: _pictureController,
              labelText: 'picture',
            ),
            const SizedBox(
              height: 20,
            ),
            // ignore: avoid_unnecessary_containers
            Container(
              width: 300,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: FlightColors.buttonColor,
              ),
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  'Add Trip',
                  style: TextStyle(color: FlightColors.bgColor, fontSize: 18),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
