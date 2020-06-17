import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
        children: <Widget>[
          _cardTipo1(),
          SizedBox(height: 25.0,),
          _cardTipo2(),
          SizedBox(height: 25.0,),
          _cardTipo1(),
          SizedBox(height: 25.0,),
          _cardTipo2(),
          SizedBox(height: 25.0,),
          _cardTipo1(),
          SizedBox(height: 25.0,),
          _cardTipo2(),
          SizedBox(height: 25.0,),
          _cardTipo1(),
          SizedBox(height: 25.0,),
          _cardTipo2(),
          SizedBox(height: 25.0,),
          _cardTipo3(),
        ],
      ),
    );
  }

  Widget _cardTipo1() {
    return Card(
      elevation: 8.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.photo_album, color: Colors.blue),
            title: Text('Hola soy una Card...'),
            subtitle: Text('Esta card está creada con el widget Card. '),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(onPressed: () {}, child: Text('Cancelar')),
              FlatButton(onPressed: () {}, child: Text('OK')),
            ],
          )
        ],
      ),
    );
  }

  Widget _cardTipo2() {
    final card = Container(
      child: Column(
        children: <Widget>[

          FadeInImage(
            placeholder: AssetImage('assets/loading.gif'), 
            image: NetworkImage('https://publimetro.pe/resizer/3K2cByKJbpxH4Pojdc2d8JQqAoQ=/1200x800/smart/arc-anglerfish-arc2-prod-elcomercio.s3.amazonaws.com/public/WICZLJCBL5G3DOVMWOHZIYQF2U.jpg'),
            height: 300.0,
            fit: BoxFit.cover,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
            child: Text('La vida es Bella'),
          ),
          
        ],
      ),
    );


    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            spreadRadius: 3.0,
            offset: Offset(3, 3),
          )
        ]
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: card,
      ),
    );
  }


  Widget _cardTipo3() {
    
    return Container(
      constraints: BoxConstraints.expand(
        width: 150.0,
        height: 200.0,
      ),
     decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.blue[600],
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            spreadRadius: 3.0,
            offset: Offset(3, 3),
          )
        ]
      ),
      padding: const EdgeInsets.all(8.0),
      alignment: Alignment.center,
      child: Text(
            'Prueba de tarjeta #3...',),
      transform: Matrix4.rotationZ(0.1),
    );

  }
}