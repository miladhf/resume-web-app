import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:resume_web/pages/main/main_page.dart';
import 'package:resume_web/utils/utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('fa', 'IR'), Locale('en', 'US')],
      path: 'assets/translations',
      fallbackLocale: const Locale('fa', 'IR'),
      startLocale: const Locale('fa', 'IR'),
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
          fontFamily: 'peyda',
          scaffoldBackgroundColor: const Color(0xff101015),
          primaryColor: const Color(0xff64CFB3),
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.blue,
          ).copyWith(
            primary: const Color(0xff64CFB3),
            secondary: const Color(0xff8702b4),
            background: const Color(0xff101015),
          ),
          textTheme: TextTheme(
            displayLarge: const TextStyle(
              fontFamily: 'peyda',
              fontSize: 30,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            displayMedium: const TextStyle(
              fontFamily: 'peyda',
              fontSize: 17,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            displaySmall: const TextStyle(
              fontFamily: 'peyda',
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            bodyMedium: TextStyle(
                fontFamily: Utils.isRtlLocale(context) ? 'peyda' : 'peyda',
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
      initialRoute: '/',
      onGenerateRoute: (settings) {
        if (settings.name == '/en') {
          context.setLocale(const Locale('en', 'US'));
        } else if (settings.name == '/fa') {
          context.setLocale(const Locale('fa', 'IR'));
        }

        if (settings.name == '/') {
          return MaterialPageRoute(builder: (_) => const MainPage());
        }
      },
    );
  }
}
