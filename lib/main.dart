import 'package:electrophorus_site/views/about.dart';
import 'package:electrophorus_site/views/guide.dart';
import 'package:flutter/material.dart';
import 'views/demo.dart';

import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Electrophorus',
      routes: {
        '/': (_) => Home(),
        '/demo': (_) => DemoView(),
        '/guide': (_) => GuideView(),
        '/about': (_) => AboutView(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
