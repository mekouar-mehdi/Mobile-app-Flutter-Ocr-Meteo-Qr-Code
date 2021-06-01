import 'package:flutter/material.dart';
import 'package:my_first_app_flutter/widgets/drawer.widget.dart';

class QuizPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: MyDrawer(),
      appBar: AppBar(
        title: Text("my quiz page clicked !!"),
      ),
      body: Center(
        child: Text("QUIZ"),
      ),
    );
  }
}

