import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:resume_web/pages/home/home_page.dart';
import 'package:resume_web/utils/utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('fa', 'IR'), Locale('en', 'US')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en', 'US'),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    EasyLocalization.of(context)?.locale;

    return MaterialApp(
      title: 'Resume',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
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
          textTheme: TextTheme(
            headline1: const TextStyle(
                fontFamily: 'shabnam-bold', fontSize: 30, color: Colors.white),
            headline2: const TextStyle(
                fontFamily: 'shabnam-bold', fontSize: 17, color: Colors.white),
            headline3: const TextStyle(
                fontFamily: 'shabnam-bold', fontSize: 16, color: Colors.white),
            bodyText1: TextStyle(
                fontFamily:
                    Utils.isRtlLocale(context) ? 'shabnam' : 'shabnam-bold',
                fontSize: 14,
                color: Colors.white),
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
