import 'package:flutter/material.dart';


class DrawerItem extends StatelessWidget {
  String itemTitle;
  String route;
  Icon icon;

  DrawerItem(this.itemTitle,this.route,this.icon);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        ListTile(
          leading: this.icon,

          trailing: Icon(Icons.arrow_right, color: Colors.blue,),
          title: Text("${this.itemTitle}",style: TextStyle(fontSize: 23, color: Colors.blue),),
          onTap: (){
            /*Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()
                          ));*/
            Navigator.pop(context);
            Navigator.pushNamed(context, "${this.route}");
          },
        ),
        Divider(
          thickness: 3,
          color: Colors.lightBlueAccent,
          indent: 10,
          endIndent: 10,
        ),
      ],
    );
  }
}
