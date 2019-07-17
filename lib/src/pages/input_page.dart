import 'package:flutter/material.dart';

class Inputpage extends StatefulWidget {
  Inputpage({Key key}) : super(key: key);

  _InputpageState createState() => _InputpageState();
}

class _InputpageState extends State<Inputpage> {
  String _nombre = '';
  FocusNode _myFocusNode = FocusNode();

  @override
  void dispose() {
    _myFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs de texto'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _crearInput(),
          Divider(),
          _crearPersona(),
        ],
      ),
    );
  }

  Widget _crearInput() {
    return TextField(
       // autofocus: false,
       onChanged: (value) {
         setState(() {
           _nombre = value;
         });
       },
       textCapitalization: TextCapitalization.sentences,
       decoration: InputDecoration(
         border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
         counter: Text('Letras ${_nombre.length}'),
         hintText: 'Nombre de la persona',
         labelText: 'Nombre',
         helperText: 'Solo el nombre',
         suffixIcon: Icon(Icons.person),
         icon: Icon(Icons.account_circle)
       ),
    );
  }

  Widget _crearPersona() {
    return ListTile(
      title: Text('Nombre es: $_nombre')
    );
  }
}