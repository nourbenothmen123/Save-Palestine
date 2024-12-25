import 'package:flutter/material.dart';

class gallery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page Gallery'),
      ),
      body: Center(
        child: Text(
          'Welcome to the Gallery Page!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
