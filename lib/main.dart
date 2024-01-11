import 'package:count_provider/screen/example_one.dart';
import 'package:count_provider/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/count_provider.dart';
import 'provider/example_one_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return ChangeNotifierProvider(
    //   create: (_) => CountProvider(),
    //   child: MaterialApp(
    //     home: HomeScreen(),
    //   ),
    // );

    // return ChangeNotifierProvider(
    //   create: (_) => ExampleOneProvider(),
    //   child: MaterialApp(
    //     home: ExampleOne(),
    //   ),
    // );

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CountProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ExampleOneProvider(),
        ),
      ],
      child: MaterialApp(
        home: ExampleOne(),
      ),
    );
  }
}
