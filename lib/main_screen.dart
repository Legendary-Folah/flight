import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hotel_ui/core/colors/colors.dart';
import 'package:hotel_ui/features/Trip/Presentation/screens/add_trip_screen.dart';
import 'package:hotel_ui/features/Trip/Presentation/screens/my_trip_screen.dart';

import 'features/Trip/Logic/provider/trip_provider.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  final PageController _controller = PageController();

  late int _currentIndex = 0;

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void _onItemTapped(int index) {
   setState(() {
     _currentIndex = index;
     _controller.animateToPage(
       index,
       duration: const Duration(milliseconds: 300),
       curve: Curves.easeIn,
     );
   });
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(tripListNotifierProvider.notifier).loadTrips();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: FlightColors.bgColor,
        elevation: 0,
        centerTitle: false,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi Fola',
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: FlightColors.defaultTextColor),
            ),
            Text(
              'Travelling today ?',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: FlightColors.defaultTextColor),
            ),
          ],
        ),
      ),
      backgroundColor: FlightColors.bgColor,
      body: PageView(
        controller: _controller,
        onPageChanged: (int index) {
          _currentIndex = index;
        },
        children: [
          const MyTripScreen(),
          AddTripScreen(),
          const Center(child: Text('3'))
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.list,
            ),
            label: 'My Trips',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add,
            ),
            label: 'Add Trips',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.map,
            ),
            label: 'Maps',
          ),
        ],
      ),
    );
  }
}
