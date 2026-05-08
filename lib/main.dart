import 'package:flutter/material.dart';
import 'package:animals_sounds/screen/home_page.dart';

void main() {
  runApp(const AnimalsSoundsApp());
}

class AnimalsSoundsApp extends StatelessWidget {
  const AnimalsSoundsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomePage());
  }
}
