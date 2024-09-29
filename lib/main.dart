import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ricomusic/pages/dashboard_bottomnav.dart';
import 'package:ricomusic/pages/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
     return GetMaterialApp(
      initialRoute: '/',
      getPages: [
        //list all pages
        GetPage(
          name: '/',
          page: () => LoginPage(),
        ),
        GetPage(
          name: '/dashboard',
          page: () => DashboardPage(),
        )
      ],
    );
  }
}

