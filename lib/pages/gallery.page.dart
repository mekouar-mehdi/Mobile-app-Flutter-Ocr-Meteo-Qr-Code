import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GalleryPixaby extends StatefulWidget {
  String keyword;
  @override
  _GalleryPixabyState createState() => _GalleryPixabyState();
}



class _GalleryPixabyState extends State<GalleryPixaby> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gallery"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "entrer un key word",
                      border: OutlineInputBorder(),
                      alignLabelWithHint: true,
                      labelText: "Key Word",
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold
                      )
                    ),
                    onChanged: (key){
                        setState(() {
                          this.widget.keyword=key;
                          print("changed" + key);
                        });
                    },
                    autofocus: true,
                  ),
                ),
              Container(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.yellow,
                        textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 30
                      )
                    ),
                    child: Text("Get Data"),

                ),
              )
            ],
          ),
        ),
      )

    );
  }
}
