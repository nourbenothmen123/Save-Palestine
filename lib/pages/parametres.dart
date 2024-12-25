import 'package:flutter/material.dart';

class parametres extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page Parametres'),
      ),
      body: Center(
        child: Text(
          'Welcome to the parametres Page!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
