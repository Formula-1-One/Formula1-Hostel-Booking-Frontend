import 'package:flutter/material.dart';
import 'package:hostel_booking_app_ui_f1/pages_login/login_components/homescreen.dart';
import 'package:responsive_framework/responsive_framework.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hostel Booking ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
      builder: (context, child) => ResponsiveWrapper.builder(
          child,
          maxWidth: 1200,
          minWidth: 480,
          defaultScale: true,
          breakpoints: [
            const ResponsiveBreakpoint.resize(480, name: MOBILE),
            const ResponsiveBreakpoint.autoScale(800, name: TABLET),
            const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
            const ResponsiveBreakpoint.autoScale(2460, name: '4K'),

          ],
          background: Container(color: const Color(0xFFF5F5F5))),
      initialRoute: "/",
    );

  }
}

