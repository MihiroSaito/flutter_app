//Googleのマテリアルデザインを読みこむ
import 'package:flutter/material.dart';

import 'next_page.dart';

//MyAppをスクリーンに表示する
void main() {
  runApp(MyApp());
}

//StatelessWidgetとは見た目の変更が起きないウィジェット
//StatefulWidgetは見た目の変化が起きるウィジェット

//MyAppクラスはStatelessWidgetを継承している
class MyApp extends StatelessWidget {

  @override
  //material.dartでつかわれているMaterialApp(マテリアルデザイン)を返す
  Widget build(BuildContext context) {

    //MaterialAppでは引数に『タイトル』、『テーマ色などのテーマ情報』、
    // 『初期画面のクラス』を指定
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.green,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Welcome to Flutter'),
    );
  }
}

//MyHomePageはStatefulWidgetを継承している
class MyHomePage extends StatefulWidget {

  //コンストラクタに『key』、『title』を渡す。keyはデフォルトでユニークなもの
  //super(key: key)で別のコンストラクタの処理を追加で行い、親クラスにもキーを渡す
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  //statefulWidgetなためステートを作成する
  _MyHomePageState createState() => _MyHomePageState();
}

//_MyHomePageStateの型を持ったステートを継承
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  String text;

  //ボタンを押されたらこの関数が呼ばれる
  void _incrementCounter() {

    //画面の再描画をする
    setState(() {

      //カウントをインクリメント
      _counter++;
    });
  }

  @override
  //ウィジェットのビルドをする。この中にボタンや変化するテキストなどのビューの内容を設定
  Widget build(BuildContext context) {

    //足場という意味で画面を作成する際のパーツが入っている
    return Scaffold(

      //上のバー
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),

      //内容の中心のものを配置する
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.android_outlined,
              size: 100,
              color: Colors.green,
            ),
            Image.network("https://images.unsplash.com/photo-1552071379-041b32707fed?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80"),
            Image.asset('images/gorilla.jpg'),
            RaisedButton(
              child: Text('次へ'),
              onPressed: () async {
                final result = await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NextPage('MyHomePageの値'),
                    )
                );
                text = result;
              },
            ),
          ],
        ),
      ),
    );
  }
}
