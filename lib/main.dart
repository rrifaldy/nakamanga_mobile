import 'package:flutter/material.dart';

import './home.dart' as home;
import './genre.dart' as genre;
import './manga.dart' as manga;

int _selectedIndex = 0;
void main() {
  runApp(new MaterialApp(
    home: new index(),
  ));
}

class index extends StatefulWidget {
  @override
  _indexState createState() => _indexState();
}

class _indexState extends State<index> with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    controller = new TabController(vsync: this, length: 3);
    super.initState();
  }

  @override
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.indigo[600],
        title: new Text("Nakamanga"),
       actions: <Widget>[new Icon(Icons.search)],
      ),
      body: new IndexedStack(
        index: _selectedIndex,
        children: <Widget>[
          new home.home(),
          new genre.genre(),
          new manga.manga()
        ],
      ),
      bottomNavigationBar: new BottomNavigationBar(
        backgroundColor: Colors.indigo[600],
        unselectedItemColor: Colors.white30,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            title: Text('Genre'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            title: Text('Manga'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}