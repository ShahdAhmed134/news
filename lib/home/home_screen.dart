import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.cyanAccent,
      appBar: AppBar(
        title: Text('News App'),
        centerTitle: true,
      ),
    );
  }
}
