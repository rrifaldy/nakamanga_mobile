import 'package:flutter/material.dart';

void main(){
  runApp(
    new MaterialApp(
      title: "Halaman satu",
      home: new Info(),
    )

 
  );
}


class Info extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Halaman satu"),
      ),
      body: new Container(
        padding: EdgeInsets.all(20.0),
        child: new Center(
          child: new Text("Halaman satu"),
        )
      )
    );
  }
}