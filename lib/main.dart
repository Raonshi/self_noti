import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:self_noti/src/home/page.dart';
import 'package:self_noti/style/styles.dart';


void main() {
  Provider.debugCheckInvalidValueType = null;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      home: const HomePage(),
    );
  }
}
