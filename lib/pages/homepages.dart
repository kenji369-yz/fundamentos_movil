import 'package:flutter/material.dart';

void main() => runApp(const Homepages());

class Homepages extends StatelessWidget {
  const Homepages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('home pages'),
      ),
      body: const Center(
        child: Text('bienvenido al home pages0'),
      ),
      );
  }
}