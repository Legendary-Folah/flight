import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hotel_ui/features/Trip/Data/models/trip_model.dart';
import 'package:hotel_ui/features/Trip/Presentation/screens/main_screen.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //Initialize Hive and open your box
  await Hive.initFlutter((await getApplicationDocumentsDirectory()).path);
  Hive.registerAdapter(TripModelAdapter());
  await Hive.openBox<TripModel>('trips');
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flight_travel',
      home: MainScreen(),
    );
  }
}
