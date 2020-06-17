import 'package:flutter/material.dart';
import 'dart:math';

class AnimatedContainerPage extends StatefulWidget {

  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {

  double _width = 50.0;
  double _heigth = 50.0;
  Color _color = Colors.red;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8.0);

  @override
  Widget build(BuildContext context) {
    return Container(
       child: Scaffold(
         appBar: AppBar(
          title: Text('Contenedor de Animacion'),
         ),
         body: Center(
           child: AnimatedContainer(
              duration: Duration(milliseconds: 800),
              curve: Curves.fastOutSlowIn,
              width: _width,
              height: _heigth,
              decoration: BoxDecoration(
                borderRadius: _borderRadius,
                color: _color,
              ),
           )
         ),
         floatingActionButton: FloatingActionButton(
          onPressed: (){_cambiarCaracteristicas();},
          child: Icon(Icons.gamepad),
        ),
       ),
    );
  }

  _cambiarCaracteristicas(){
    final random = Random();

    setState(() {
      _color  = Color.fromRGBO(
        random.nextInt(255), 
        random.nextInt(255), 
        random.nextInt(255), 
        1.0);
      _width  = random.nextInt(250).toDouble();
      _heigth = random.nextInt(290).toDouble();
      _borderRadius = BorderRadius.circular(random.nextInt(100).toDouble());
    });
  }
}