import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {

  final opciones = ['Santy','Nia','Simon','Monita','Lila','Orion'];
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes Temp'),
        centerTitle: true,
      ),
      body: ListView(
        children: _crearItemsShort(),
      ),
    );
  }

  List<Widget> _crearItems(){
    List<Widget> lista = new List<Widget>();

    for (String opcion in opciones) {
      final tmpWidget = ListTile(
        title: Text(opcion),
      );

      lista..add(tmpWidget)
           ..add(Divider(height: 5.0,color: Color.fromRGBO(10, 15, 85, 2.0),));
    }
    return lista;
  }

   List<Widget> _crearItemsShort(){
     var widgets = opciones.map(
       (item){
        return Column(
          children: <Widget>[
            ListTile(
              title: Text(item),
              subtitle: Text('Subtitle'),
              leading: Icon(Icons.account_circle),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: (){},
             ),
             Divider(),
          ],
        );
      }
     ).toList();

      return widgets;
   }
}