import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hotel_ui/features/Trip/Logic/provider/trip_provider.dart';

class MyTripScreen extends ConsumerWidget {
  const MyTripScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tripList = ref.watch(tripListNotifierProvider);
    print('triplist: $tripList');
    return ListView.builder(
      itemCount: tripList.length,
        itemBuilder: (context, index) {
        final trip = tripList[index];
        return Text(trip.title!);
        });
  }
}
