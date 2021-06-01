import 'package:flutter/material.dart';
import 'package:my_first_app_flutter/widgets/drawer.widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("APP HOME PAGE"),
      ),
      body: Center(
        child: Text("HOME"),
      ),
    );
  }
}

