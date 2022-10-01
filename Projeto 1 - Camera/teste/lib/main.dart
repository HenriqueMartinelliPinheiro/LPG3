import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teste/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Teste',
      theme: ThemeData(
      textTheme: GoogleFonts.oswaldTextTheme(
        Theme.of(context).textTheme
      ),
      primarySwatch: Colors.lightGreen,
      brightness: Brightness.dark,
     ),
      home: HomePage(),
    );
  }
}