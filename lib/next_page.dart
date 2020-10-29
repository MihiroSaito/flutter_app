import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';

class NextPage extends StatelessWidget {
  NextPage(this.name);
  final String name;


  final items = List<String>.generate(10000, (i) => "Item $i");

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      //上のバー
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("次の画面"),
      ),

      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
        child: GridView.count(
          //横に列
          crossAxisCount: 3,
          //リストを100個作る
          children: List.generate(100, (index){
            return Column(
              children: [
                Expanded(
                  child: Image.asset('images/gorilla.jpg'),
                ),
                Text("ゴリラ$index")
              ],
            );
          })
        )
      ),
    );
  }

}