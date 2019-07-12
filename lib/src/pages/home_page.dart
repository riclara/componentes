import 'package:flutter/material.dart';
import 'package:componentes/src/providers/menu_providers.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),
      ),
      body: _lista(),
    );
  }

  Widget _lista() {
    // menuProvider.cargarData().then((opciones) {
    //   print(opciones);
    // });
    // return ListView(children: _listaItems());
    return FutureBuilder(
        future: menuProvider.cargarData(),
        initialData: [],
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          return ListView(children: _listaItems(snapshot.data));
        });
  }

  List<Widget> _listaItems(List<dynamic> data) {
    return data.map((ruta) {
      return Column(
        children: <Widget>[
          ListTile(
            title: Text(ruta['texto']),
            leading: Icon(Icons.account_circle, color: Colors.blue),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {},
          ),
          Divider()
        ],
      );
    }).toList();
  }
}
