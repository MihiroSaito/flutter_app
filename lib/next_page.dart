import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';

class NextPage extends StatelessWidget {
  NextPage(this.name);
  final String name;

  final myFocusNode = FocusNode();

  String value;

  final myController = TextEditingController();

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
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(name),
              RaisedButton(
                child: Text("戻る"),
                onPressed: (){
                  Navigator.pop(context, 'nextPageの値');
                },
              ),
              RaisedButton(
                child: Text("進む"),

              ),
              Text(
                "この文字を装飾します",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  decoration: TextDecoration.underline
                ),
              ),
              DefaultTextStyle(
                style: TextStyle(
                  color: Colors.green
                ),
                child: Column(
                  children: [
                    Text("この文字はデフォルトです"),
                    Text("この文字はデフォルトです"),
                    Text("この文字はデフォルトです"),
                    Text("この文字はデフォルトです"),
                    Text("この文字はデフォルトです"),
                  ],
                ),
              ),
              Text("この文字はデフォルトじゃないです"),
              TextField(
                controller: myController,
                autofocus: true,
                focusNode: myFocusNode,
                decoration: InputDecoration(
                  hintText: 'ここはテキストフィールドです',
                ),
                onChanged: (text) {
                  value = text;
                  print("値=$value");
                },
              ),
              RaisedButton(
                child: Text('フォーカス'),
                onPressed: (){
                  myFocusNode.requestFocus();
                },
              ),
              RaisedButton(
                child: Text('出力'),
                onPressed: (){
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Text(myController.text),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

}