import 'package:flutter/material.dart';

class Buisness extends StatefulWidget {
  const Buisness({super.key});

  @override
  State<Buisness> createState() => _BuisnessState();
}

class _BuisnessState extends State<Buisness> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buisness'),
      ),
      body: const Center(child: Text('Buisness')),
    );
  }
}
