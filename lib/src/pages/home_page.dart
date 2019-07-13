import 'package:flutter/material.dart';
import 'package:componentes/src/utils/icono_string_util.dart';
import 'package:componentes/src/providers/menu_providers.dart';
import 'package:componentes/src/pages/alert_page.dart';

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
          return ListView(children: _listaItems(snapshot.data, context));
        });
  }

  List<Widget> _listaItems(List<dynamic> data, BuildContext context) {
    return data.map((opt) {
      return Column(
        children: <Widget>[
          ListTile(
            title: Text(opt['texto']),
            leading: getIcon(opt['icon']),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.pushNamed(context, opt['ruta']);
            },
          ),
          Divider()
        ],
      );
    }).toList();
  }
}
