import 'package:flutter/material.dart';
import 'package:my_first_app_flutter/global/global.parameter.dart';
import 'package:my_first_app_flutter/pages/home.page.dart';
import 'package:my_first_app_flutter/widgets/drawer.header.dart';
import 'package:my_first_app_flutter/widgets/drawer.item.widget.dart';


class MyDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Drawer(
      child: ListView(
        children: [
          MyDrawerHeaderWidget(),
          ...(GlobalParameter.menus).map((item){
            return DrawerItem(item['title'],item['route'],item['icon']);
          }),

          /*ListTile(
            leading: Icon(Icons.home, color: Colors.blue,),
            trailing: Icon(Icons.arrow_right, color: Colors.blue,),
            title: Text("Home",style: TextStyle(fontSize: 30, color: Colors.blue),),
            onTap: (){
                  /*Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()
                      ));*/
              Navigator.pop(context);
              Navigator.pushNamed(context, "/home");
            },
          ),
          Divider(height: 10,),
          ListTile(
            leading: Icon(Icons.countertops, color: Colors.blue,),
            trailing: Icon(Icons.arrow_right, color: Colors.blue,),
            title: Text("counter",style: TextStyle(fontSize: 30, color: Colors.blue),),
            onTap: (){
              Navigator.pop(context);
              Navigator.pushNamed(context, "/counter");

            },
          ),
          Divider(height: 10,),
          ListTile(
            leading: Icon(Icons.question_answer, color: Colors.blue,),
            trailing: Icon(Icons.arrow_right, color: Colors.blue,),
            title: Text("Quiz",style: TextStyle(fontSize: 30, color: Colors.blue),),
            onTap: (){
              Navigator.pop(context);
              Navigator.pushNamed(context, "/quiz");

            },
          )*/
        ],
      ),
    );
  }
}
