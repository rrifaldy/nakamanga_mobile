import 'package:flutter/material.dart';

class viewManga extends StatefulWidget {
  List list;
  int index;
  viewManga({this.index, this.list});
  @override
  _viewMangaState createState() => _viewMangaState();
}

class _viewMangaState extends State<viewManga> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
          title: new Text("${widget.list[widget.index]['judul_komik']}")),
      body: new Container(
        padding: const EdgeInsets.all(20.0),
        child: new Card(
          child: new Center(
            child: new Column(
              children: <Widget>[
                new Text(
                  widget.list[widget.index]['author'],
                  style: new TextStyle(fontSize: 20.0),
                  textAlign: TextAlign.left,
                ),
                new Text(
                  widget.list[widget.index]['status'],
                  style: new TextStyle(fontSize: 20.0),
                  textAlign: TextAlign.left,
                ),
                new Text(
                  widget.list[widget.index]['sinopsis'],
                  style: new TextStyle(fontSize: 20.0),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}