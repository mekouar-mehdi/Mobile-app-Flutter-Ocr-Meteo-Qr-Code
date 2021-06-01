import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_first_app_flutter/pages/repositories.page.dart';

class UserPage extends StatefulWidget {

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  String query;
  TextEditingController queryTextEditingController = new TextEditingController();
  dynamic data;
  int currentPage=0;
  int pageSize=20;
  int totalPages=0;
  ScrollController scrollController = new ScrollController();

  List<dynamic> items=[];
  bool notVisible=false;


  //search method
  _search(String query){
      Uri queryUrl =Uri.parse("https://api.github.com/search/users?q=${this.query}&per_page=${this.pageSize}&page=${this.currentPage}");
      http.get(queryUrl)
          .then((response){
            setState(() {
              this.data = json.decode(response.body);
              this.items.addAll(data["items"]);
              if(this.data["total_count"]%this.pageSize==0){
                this.totalPages = data["total_count"]~/pageSize;
              }else{
                this.totalPages = (data["total_count"]/pageSize).floor()+1;
              }
            });
            //print(data);
      })
          .catchError((onError){
            print(onError);
      });
  }

  //fonction de initState
  @override
  void initState() {
    print("init state **************");
    this.scrollController.addListener(() {
      if(this.scrollController.position.pixels==scrollController.position.maxScrollExtent){
       if(currentPage<totalPages){
         setState(() {
           ++currentPage;
           this._search(query);
           print("${currentPage}/${totalPages}");
         });
       }
      }
    });

    
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Users:${this.query} => ${this.currentPage}/${this.totalPages}",
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: TextFormField(
                    obscureText: !notVisible,
                    controller: queryTextEditingController,
                    onChanged: (value){
                      setState(() {
                        this.query = value;
                      });
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(12),
                      icon: Icon(Icons.person),
                      suffixIcon: IconButton(
                        icon: Icon(
                            (notVisible)?
                            Icons.visibility:Icons.visibility_off
                        ),
                        onPressed: (){
                          setState(() {
                            this.notVisible = !this.notVisible;
                          });
                        },
                      ),
                      hintText: 'username',
                      labelText: 'Name of User',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.red
                        )
                      )
                    ),
                  ),
                ),
              ),
            IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.green,
                ),
                onPressed: (){
                  setState(() {
                    this.data=null;
                    this.items=[];
                    this.currentPage=0;
                    this.totalPages=0;
                    this.query = queryTextEditingController.text;
                    //print("Value of print => ${query}");
                    _search(this.query);
                  });
                }),
            ],

          ),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context,index){
                return Divider(
                  height: 12,
                  thickness: 3,
                  endIndent: 20,
                  indent: 20,
                  color: Colors.green,

                );
              },
              controller: scrollController,
              itemCount: items.length,
              itemBuilder: (context,index){
                  return ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(
                                items[index]["avatar_url"],
                              ),
                              radius: 30,
                            ),
                            SizedBox(width: 12,),
                            Text(
                                "${items[index]['login']}",
                            ),

                          ],
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.green,
                          child: Text(
                              "${items[index]["score"]}"
                          ),
                          radius: 25,
                        ),
                      ],
                    ),
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RepositoryPage(
                              username: items[index]["login"],
                              avatarUrl: items[index]["avatar_url"],
                            ),
                        ),
                      );
                    },
                  );
              },

            ),
          )
        ],
      )
    );
  }
}
