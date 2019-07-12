import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final opciones = ['Uno', 'Dos', 'Tres', 'Cuatro', 'Cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes temp'),
      ),
      body: ListView(children: _crearItemsCorta()),
    );
  }

  List<Widget> _crearItems() {
    List<Widget> lista = new List<Widget>();
    for (var opt in opciones) {
      final tempWidget = ListTile(
        title: Text(opt),
      );
      lista..add(tempWidget)..add(Divider());
    }
    return lista;
  }

  List<Widget> _crearItemsCorta() {
    var widgets = opciones.map((opcion) {
      return Column(
        children: <Widget>[
          ListTile(
            title: Text(opcion),
            subtitle: Text('data'),
            leading: Icon(Icons.ac_unit),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              
            },
          ),
          Divider()
        ],
      );
    });
    return widgets.toList();
  }
}
