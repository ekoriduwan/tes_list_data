import 'package:flutter/material.dart';
import './src/article.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      routes: {},
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Article> _articles = articles;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: RefreshIndicator(
        child: ListView(
          children: _articles.map(_buildItem).toList(),
        ),
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 1));
          setState(() {
            _articles.removeAt(0);
          });
        },
      )),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _buildItem(Article article) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ExpansionTile(
        title: Text(article.post),
        children: <Widget>[
          Text("${article.comment.toString()} Comments"),
        ],
      ),
    );
  }
}
