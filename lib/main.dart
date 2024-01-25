import 'package:flutter/material.dart';

void main() {
  runApp(const MainActivity());
}

class MainActivity extends StatelessWidget {
  const MainActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        
      }
    );
  }
}
