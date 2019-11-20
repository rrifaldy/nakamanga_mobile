import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './genreView.dart';
class genre extends StatelessWidget {
  Future<List> getData() async {
    final response =
        await http.get("http://nakamamg.000webhostapp.com/api/komik");
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? new ItemList(
                  list: snapshot.data,
                )
              : new Center(
                  child: new CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;
  ItemList({this.list});
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return new Container(
          padding: const EdgeInsets.all(10.0),
          child: new GestureDetector(
            onTap: ()=>Navigator.of(context).push(
              new MaterialPageRoute(
                builder: (BuildContext context)=> new Detail(list: list,index: i,)
            ),
            ),
          child: new Card(
            child: new ListTile(
              title: new Text(list[i]['nama_genre']),
              leading: new Icon(Icons.sentiment_satisfied),
            ),
          ),
        ),
        );
      },
    );
  }
}