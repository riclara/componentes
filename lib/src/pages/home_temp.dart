import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  const HomePageTemp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes temp'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('List Tile Title'),
          ),
          Divider(),
          ListTile(
            title: Text('List Tile Title'),
          ),
          Divider(),
          ListTile(
            title: Text('List Tile Title'),
          ),
          Divider()
        ],
      ),
    );
  }
}
