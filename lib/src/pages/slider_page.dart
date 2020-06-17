import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  SliderPage({Key key}) : super(key: key);

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  
  double _valorSlider = 100.0;
  bool _bloquearCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
          title: Text('Sliders'),
       ),
       body: Container(
         padding: EdgeInsets.only(top:50.0),
         child: Column(
           children: <Widget>[
             _crearSlider(),
             _crearCheckbox(),
             _crearSwitch(),
             Expanded(
               child: _crearImagen()
             ),
           ],
         ),
       ),
    );
  }

  Widget _crearSlider() {

    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Tamaño de imagen: $_valorSlider',
      divisions: 25,
      value: _valorSlider,
      min: 10.0,
      max: 400.0, 
      onChanged: ( _bloquearCheck ) ? null :( valor ){
        setState(() {
          _valorSlider = valor;
        });
      }
    );
  }

  Widget _crearImagen() {
    return Image(
      image: NetworkImage('http://pngimg.com/uploads/deadpool/deadpool_PNG105.png'),
      width: _valorSlider,
      fit: BoxFit.contain,
    );
  }

  Widget _crearCheckbox() {
    return CheckboxListTile(
      title: Text('Bloquear Slider'),
      value: _bloquearCheck, 
      onChanged: (valor){
        setState(() {
          _bloquearCheck = valor;
        });
      }
    );
  }

  Widget _crearSwitch() {
    return SwitchListTile(
      title: Text('Bloquear Slider'),
      value: _bloquearCheck, 
      onChanged: (valor){
        setState(() {
          _bloquearCheck = valor;
        });
      }
    );
  }
}