import 'package:flutter/material.dart';
import 'package:uasmobile/landing.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'blog',
      theme: ThemeData.light(),
      home: Landing(),
    );
  }
}