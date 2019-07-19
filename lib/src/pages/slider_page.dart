import 'package:flutter/material.dart';


class SliderPage extends StatefulWidget {
  SliderPage({Key key}) : super(key: key);

  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSlider = 100.0;
  bool _bloquearCheck = false;

  @override
  Widget build(BuildContext context) {
    return Container(
       child: Scaffold(
         appBar: AppBar(
           title: Text('Sliders'),
         ),
         body: Container(
           padding: EdgeInsets.only(top: 50.0),
           child: Column(
             children: <Widget>[
               _crearSlider(),
               _crearSwitchTile(),
               Expanded(child: _crearImagen())
             ],
           ),
         ),
       ),
    );
  }

  Widget _crearSlider() {
    return Slider(
      
      activeColor: Colors.indigoAccent,
      label: 'Tamaño de la imagen',
      value: _valorSlider,
      min: 10.0,
      max: 275.0,
      onChanged: (_bloquearCheck) ? null : ( value ) {
        setState(() {
          _valorSlider = value;
          print(_valorSlider);
        });
        
      },
    );
  }

  Widget _crearCheckBox() {
    return Checkbox(
      value: _bloquearCheck,
      onChanged: (value) {
        setState(() {
          _bloquearCheck = value;
        });
      },
    );
  }

  Widget _crearCheckBoxTile() {
    return CheckboxListTile(
      title: Text('Bloquear slider'),
      value: _bloquearCheck,
      onChanged: (value) {
        setState(() {
          _bloquearCheck = value;
        });
      },
    );
  }
  
  Widget _crearSwitchTile() {
    return SwitchListTile(
      title: Text('Bloquear slider'),
      value: _bloquearCheck,
      onChanged: (value) {
        setState(() {
          _bloquearCheck = value;
        });
      },
    );
  }

  Widget _crearImagen() {
    return Image(
      image: NetworkImage('https://media.idownloadblog.com/wp-content/uploads/2016/12/1080x1920-mario-hd-mobile-iphone-wallpaper.jpg'),
      width: _valorSlider,
      fit: BoxFit.contain,
    );
  }
}