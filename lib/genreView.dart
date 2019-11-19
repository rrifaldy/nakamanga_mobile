import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  List list;
  int index;
  Detail({this.index,this.list});
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: new Text("${widget.list[widget.index]['nama_genre']}")),
      body: new Container(
        padding: const EdgeInsets.all(20.0),
        child: new Card(
          child: new Center(
              child: new Column(
                children: <Widget>[
                new Text(widget.list[widget.index]['nama_genre'], style: new TextStyle(fontSize: 20.0),),
                ],
              ),
            ),
          ),
        ),
      );
  }
  }