import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hotel_ui/core/colors/colors.dart';

class MainScreen extends ConsumerWidget {
  MainScreen({super.key});

  final PageController _controller = PageController();
  late int _currentIndex = 0;

  void dispose() {
    _controller.dispose();
  }

  void _onItemTapped(int index) {
    _currentIndex = index;
    _controller.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: FlightColors.appBarColor,
        centerTitle: false,
      ),
      backgroundColor: FlightColors.bgColor,
      body: PageView(
        controller: _controller,
        onPageChanged: (int index) {
          _currentIndex = index;
        },
        children: const [
          Center(child: Text('1')),
          Center(child: Text('2')),
          Center(child: Text('3'))
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
