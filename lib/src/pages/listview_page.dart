import 'package:flutter/material.dart';
import 'dart:async';

class ListaPage extends StatefulWidget {
  ListaPage({Key key}) : super(key: key);

  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {

  ScrollController _scrollController = new ScrollController();
  List<int> _listaNumeros  = new List();
  int _ultimoItem = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

    _agregar10();

    _scrollController.addListener(() {
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        _fetchData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('Listas'),
       ),
       body: Stack(
         children: <Widget>[
          _crearLista(),
          _crearLoading(),
         ],
      ),
    );
  }

  Widget _crearLista() {

    return RefreshIndicator(
        
        onRefresh: _obtenerPaginaInicial,

        child: ListView.builder(
        controller: _scrollController,
        itemCount: _listaNumeros.length,
        itemBuilder: (BuildContext context, int index){
          final int imagenId = _listaNumeros[index];

          return FadeInImage(
            placeholder: AssetImage('assets/loading.gif'), 
            image: NetworkImage('https://picsum.photos/400/500?random=$imagenId')
          );
        },
      ),
    );

  }

  void _agregar10(){

    for (var i = 1; i <= 10; i++) {
      _ultimoItem++;
      _listaNumeros.add(_ultimoItem);
    }
    setState(() { });

  }

  Future _fetchData()async {
    _isLoading = true;
    setState(() {});

    final duration = new Duration(seconds: 2);

    return new Timer(
      duration,
      _respuestaHTTP,
    );
  }

  void _respuestaHTTP() {
    _isLoading = false;

    _scrollController.animateTo(
      _scrollController.position.pixels + 100,
      duration: Duration(milliseconds: 250,), 
      curve: Curves.fastOutSlowIn
    );
    
    _agregar10();
  }

  Widget _crearLoading() {
      if(_isLoading){
        return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: <Widget>[
                CircularProgressIndicator()
              ],
            ),
            SizedBox(height: 15.0,)
          ],
        );
        
        
      }else{
        return Container();
      }
  }

  Future<Null> _obtenerPaginaInicial() async{

    final duration = new Duration(seconds: 2);

    

  }
}