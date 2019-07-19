import 'package:flutter/material.dart';

class Inputpage extends StatefulWidget {
  Inputpage({Key key}) : super(key: key);

  _InputpageState createState() => _InputpageState();
}

class _InputpageState extends State<Inputpage> {
  String _nombre = '';
  String _email = '';
  String _password = '';
  String _fecha;
  String _opcionSeleccionada = 'Volar';
  List<String> _poderes = ['Volar', 'Rayos X', 'Fuerza'];
  FocusNode _myFocusNode = FocusNode();
  TextEditingController _fieldDateController = TextEditingController();

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
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha(context),
          Divider(),
          _crearDropdown(),
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
      title: Text('Nombre es: $_nombre'),
      subtitle: Text('Email: $_email'),
    );
  }

  Widget _crearEmail() {
    return TextField(
       // autofocus: false,
       keyboardType: TextInputType.emailAddress,
       onChanged: (value) {
         setState(() {
           _email = value;
         });
       },
       decoration: InputDecoration(
         border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
         hintText: 'Email',
         labelText: 'Email',
         suffixIcon: Icon(Icons.alternate_email),
         icon: Icon(Icons.email)
       ),
    );
  }

  Widget _crearPassword() {
    return TextField(
       // autofocus: false,
       obscureText: true,
       onChanged: (value) {
         setState(() {
           _password = value;
         });
       },
       decoration: InputDecoration(
         border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
         hintText: 'Password',
         labelText: 'Password',
         suffixIcon: Icon(Icons.lock),
         icon: Icon(Icons.security)
       ),
    );
  }

  Widget _crearFecha(BuildContext context) {
    return TextField(
      controller: _fieldDateController,
      // autofocus: false,
      onTap: () {
        FocusScope.of(context).requestFocus(_myFocusNode);
        _selectDate( context );
      
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: 'Fecha de nacimiento',
        labelText: 'Fecha de nacimiento',
        suffixIcon: Icon(Icons.date_range),
        icon: Icon(Icons.perm_contact_calendar)
      ),
    );
  }

  _selectDate(BuildContext context) async{
    DateTime picked = await showDatePicker(
      locale: Locale('es'),
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2018),
      lastDate: DateTime(2025)
    );
    if(picked != null) {
      setState(() {
        _fecha = picked.toString();
        _fieldDateController.text = _fecha;
      });
    }
  }

  List<DropdownMenuItem<String>> getOpcionesDroptDown () {
    List<DropdownMenuItem<String>> lista = List();
    _poderes.forEach((poder) {
      lista.add(DropdownMenuItem(
        child: Text(poder),
        value: poder,
        ));
    });
    return lista;
  }

  Widget _crearDropdown() {
    return Row(
      children: <Widget>[
        Icon(Icons.perm_data_setting),
        SizedBox(width: 10.0,),
        Expanded(
            child: DropdownButton(
            value: _opcionSeleccionada,
            items: getOpcionesDroptDown(),
            onChanged: (selected) {
              setState(() {
                _opcionSeleccionada = selected;
                print(selected);          
              });
            },
          ),
        )
      ],
    );
    
    
    
  }
}
