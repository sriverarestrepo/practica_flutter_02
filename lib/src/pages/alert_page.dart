import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Page'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){Navigator.pop(context);},
        child: Icon(Icons.keyboard_arrow_left),
      ),
      body: Center(
        child: RaisedButton.icon(
          color: Colors.blue[100],
          onPressed: () => _mostrarAlerta(context), 
          icon: Icon(Icons.add_alert, color: Colors.blue[600],), 
          label: Text(
              'Mostrar alerta!!',
              style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 15.0,
              )
          ),
          shape: StadiumBorder(),
        ),
      ),
    );
  }

  void _mostrarAlerta(BuildContext context){

    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(35.0)
          ),
          title: Text('Alerta cargada'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('Contenido de la alerta'),
              FlutterLogo(
                size: 150.0,
              )
            ],
          ),
          actions: <Widget>[
            FlatButton(onPressed: () => Navigator.of(context).pop(), child: Text('Cancelar')),
            FlatButton(onPressed: () => Navigator.of(context).pop(), child: Text('OK')),
          ],
        );
      },
    );
  }

}