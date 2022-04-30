import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:resume_web/pages/home/home_page.dart';

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
          primaryColor: const Color(0xff5900EA),
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.blue,
          ).copyWith(
            // secondary: const Color(0xffFF00C7),
            secondary: const Color(0xff8702b4),

            background: const Color(0xff232323),
          ),
          textTheme: const TextTheme(
            headline1: TextStyle(
                fontFamily: 'shabnam-bold', fontSize: 30, color: Colors.white),
            headline2: TextStyle(
                fontFamily: 'shabnam-bold', fontSize: 20, color: Colors.white),
            headline3: TextStyle(
                fontFamily: 'shabnam-bold', fontSize: 16, color: Colors.white),
            bodyText1: TextStyle(
                fontFamily: 'shabnam', fontSize: 14, color: Colors.white),
          )),
      builder: (context, widget) => ResponsiveWrapper.builder(widget,
          // maxWidth: 1200,
          // minWidth: 480,
          defaultScale: true,
          breakpoints: [
            const ResponsiveBreakpoint.resize(480, name: MOBILE),
            const ResponsiveBreakpoint.resize(800, name: TABLET),
            const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
          ],
          background: Container(color: const Color(0xFFF5F5F5))),
      home: const HomePage(),
    );
  }
}
