// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController _controller;
  String n="";
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 14, 77, 33),
        title: const Text('Teste',
        ),
      ),
      body: Center(
        child: Column(
          children: [
          TextField(
              controller: _controller,
              onSubmitted: (String nome) async {
                n = nome;
                setState(() {});
              },
            ),
            Text("Olá $n"),
          ],
        ),
      ),
    );
  }
}