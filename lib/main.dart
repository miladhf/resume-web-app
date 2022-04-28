import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Resume',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'shabnam',
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xff232323),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blue,
        ).copyWith(
          secondary: const Color(0xffFF00C7),
          background: const Color(0xff232323),
        ),
      ),
      home: Container(),
    );
  }
}

