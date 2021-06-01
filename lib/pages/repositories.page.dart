import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



class RepositoryPage extends StatefulWidget {
  String username;
  String avatarUrl;
  RepositoryPage({this.username, this.avatarUrl});

  @override
  _RepositoryPageState createState() => _RepositoryPageState();
}

class _RepositoryPageState extends State<RepositoryPage> {

  dynamic data=[];

  void _getData(String user) async{
    Uri queryUri = Uri.parse("https://api.github.com/users/${user}/repos");
    http.Response response = await http.get(queryUri);
    if(response.statusCode==200){
      setState(() {
        this.data = json.decode(response.body);
        print("query => $queryUri ***********");
        print(data);
      });
    }
    /*http.get(queryUri)
        .then((response){
      setState(() {

      });
    })
        .catchError((onError){
      print(onError);
    });*/
  }

  @override
  void initState() {
    print("init state called******************");
    this._getData(this.widget.username);
  }


  @override
  Widget build(BuildContext context) {
    print("length => ${data.length}");
    print("build method loadeed");
    return Scaffold(
      appBar: AppBar(
        title: Text("(> ${this.widget.username} <)",),
        actions: [
          CircleAvatar(
            backgroundImage: NetworkImage(this.widget.avatarUrl),
            radius: 25,
          )
        ],
      ),
      body: ListView.separated(
          separatorBuilder: (context,index){
            return Divider(
              height: 12,
              thickness: 3,
              endIndent: 20,
              indent: 20,
              color: Colors.white,
            );
          },
          itemCount: (data==null)?0:data.length,
          itemBuilder: (context,index){
            return ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: "Id: ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black
                              ),
                          ),
                          TextSpan(
                            text: "${data[index]['id']}",
                            style: TextStyle(
                                color: Colors.black
                            ),
                          ),
                        ]
                      )
                  ),
                  RichText(
                      text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Name: ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black
                              ),
                            ),
                            TextSpan(
                              text: "${data[index]['name']}",
                              style: TextStyle(
                                  color: Colors.black
                              ),
                            ),
                          ]
                      )
                  ),
                  RichText(
                      text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Owner: ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black
                              ),
                            ),
                            TextSpan(
                              text: "${data[index]['owner']['login']}",
                              style: TextStyle(
                                  color: Colors.black
                              ),
                            ),
                          ]
                      )
                  ),
                  RichText(
                      text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Created at: ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black
                              ),
                            ),
                            TextSpan(
                              text: "${data[index]['created_at']}",
                              style: TextStyle(
                                  color: Colors.black
                              ),
                            ),
                          ]
                      )
                  ),
                  RichText(
                      text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Updated at: ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black
                              ),
                            ),
                            TextSpan(
                              text: "${data[index]['updated_at']}",
                              style: TextStyle(
                                  color: Colors.black
                              ),
                            ),
                          ]
                      )
                  ),

                ],
              ),
              tileColor: Colors.lightGreenAccent,
            );
          }
      )
    );
  }
}
