import 'package:flutter/material.dart';

class UnKnownPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Unknown Page')),
      body: Center(
        child: Text('Unknown Page', style: TextStyle(fontSize: 60)),
      ),
    );
  }
}
