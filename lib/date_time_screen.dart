import 'package:flutter/material.dart';

class DateTimeScreen extends StatelessWidget {
  const DateTimeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Date And Time'),
        backgroundColor: Colors.green.shade300,
      ),
    );
  }
}