import 'package:flutter/material.dart';
import 'package:my_first_app_flutter/pages/camera.page.dart';
import 'package:my_first_app_flutter/pages/counter.page.dart';
import 'package:my_first_app_flutter/pages/gallery.page.dart';
import 'package:my_first_app_flutter/pages/home.page.dart';
import 'package:my_first_app_flutter/pages/ocr.page.dart';
import 'package:my_first_app_flutter/pages/quiz.page.dart';
import 'package:my_first_app_flutter/pages/user.page.dart';
import 'package:my_first_app_flutter/widgets/drawer.header.dart';
import 'package:my_first_app_flutter/widgets/drawer.widget.dart';

void main(){
  runApp(new MyApp());
}

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/home" : (context) => MyApp(),
        "/counter" : (context) => CounterPage(),
        "/github":(context) => UserPage(),
        "/quiz" : (context) => QuizPage(),
        "/gallery" : (context) => GalleryPixaby(),
        "/camera" : (context) => CameraPhone(),
        "/ocr" : (context) => OcrTech(),
      },
      title: "TP FLUTTER APP",
      theme: ThemeData(

        primarySwatch: Colors.amber,
        textTheme: TextTheme(
          bodyText2: TextStyle(
            fontSize: 30,
            color: Colors.green
          )
        ),
      ),
      home: Scaffold(
        drawer: MyDrawer(),
        appBar: AppBar(
          title: Text("App Flutter TP"),
        ),
        body: Center(
          child: Text(
              "home page",
            style: TextStyle(
              fontSize: 50,
              color: Colors.amber
            ),
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              heroTag:"bnt1",
              child: Icon(Icons.add),
            ),
            SizedBox(width: 10,),
            FloatingActionButton(
              heroTag: "bnt2",
              child: Icon(Icons.remove),
            )
          ],
        )
      )
    );
  }
}