import 'package:flutter/material.dart';


class CounterPage extends StatefulWidget {
  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int counter=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: MyDrawer(),
      appBar: AppBar(
        title: Text("COUNTER app"),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: (){
              setState(() {
                ++counter;
              });
            },
          ),
          SizedBox(width: 10,),
          FloatingActionButton(
            onPressed: (){
              setState(() {
                --counter;
              });
            },
            child: Icon(Icons.remove),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Counter value => ${this.counter}",style: TextStyle(
              color: Colors.indigo
            ),),
            IconButton(
                icon: Icon(Icons.add),
                onPressed: (){
                  setState(() {
                    ++counter;
                  });
                }
            ),
            RaisedButton(
                color: Colors.amber,
                child: Text("ADD"),
                onPressed: (){
                  setState(() {
                    ++counter;
                  });
            }),
            IconButton(
                icon: Icon(Icons.remove),
                onPressed: (){
                  setState(() {
                    --counter;
                  });
                }
            )
          ],
        ),
      ),
    );
  }
}

