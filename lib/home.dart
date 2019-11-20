import 'package:flutter/material.dart';


class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  List<Container> daftarManga = new List();

  var gmanga = [
    {"nama": "Death Note", "gambar": "dn.jpg"},
    {"nama": "Elizabeth", "gambar": "elizabeth.jpg"},
    {"nama": "Yuki no Shota", "gambar": "yukinoshota.jpg"},
    {"nama": "Joker", "gambar": "joker.jpg"},
    {"nama": "Kuroshijitshu", "gambar": "kuroshijitsu.jpg"},
    {"nama": "Naruto Shippuden", "gambar": "naruto.jpg"},
  ];
  _buatlist() async {
    for (var i = 0; i < gmanga.length; i++) {
      final gmanganya = gmanga[i];
      final String gambar = gmanganya["gambar"];
      daftarManga.add(new Container(
          padding: new EdgeInsets.all(7.0),
          child: new Card(
              child: new ListView(
            children: <Widget>[
              new Hero(
                tag: gmanganya['nama'],
                child: new Material(
                  child: new InkWell(
                    onTap: () =>
                        Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => new Detail(
                        nama: gmanganya['nama'],
                        gambar: gambar,
                      ),
                    )),
                    child: new Image.asset(
                      "images/$gambar",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              new Padding(
                padding: new EdgeInsets.all(10.0),
              ),
              new Text(
                gmanganya['nama'],
                style: new TextStyle(fontSize: 19.0),
              )
            ],
          ))));
    }
  }

  @override
  void initState() {
    _buatlist();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new GridView.count(
      crossAxisCount: 2,
      children: daftarManga,
    )
    );
  }
}

class Detail extends StatelessWidget {
  Detail({this.nama, this.gambar});
  final String nama;
  final String gambar;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new ListView(
        children: <Widget>[
          new Container(
              child: new Hero(
                tag: nama,
                child: new Material(
                  child: new InkWell(
                    child: new Image.asset(
                      "images/$gambar",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )),
          new BagNama(
            nama: nama,
          ),
          new Desc(),
        ],
      ),
    );
  }
}

class BagNama extends StatelessWidget {
  BagNama({this.nama});
  final String nama;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: new EdgeInsets.all(10.0),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Text(nama,
              style: new TextStyle(fontSize: 20.0, color: Colors.blue)),
        ],
      ),
    );
  }
}

class Desc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: new EdgeInsets.all(10.0),
      child: new Card(
        child: new Padding(
          padding: const EdgeInsets.all(10.0),
          child: new Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum",
            style: new TextStyle(fontSize: 18.0),
            textAlign: TextAlign.justify,
          ),
        ),
      ),
    );
  }
}