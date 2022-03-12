import './random_words.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Victor Name Generator',
      home: RandomWords(),
    );
  }
}

