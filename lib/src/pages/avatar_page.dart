import 'package:flutter/material.dart';


class AvatarPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://i.pinimg.com/originals/7e/55/84/7e558432c10a4c64fac6b09deda5a981.jpg'),
              maxRadius: 20.0,
              minRadius: 10.0,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0),
            child: CircleAvatar(
              child: Text('S2R'),
              backgroundColor: Colors.indigo,
            ),
          ),
        ],
      ),
      body: Center(
        child: FadeInImage(
          placeholder: AssetImage('assets/loading.gif'), 
          image: NetworkImage('https://i.pinimg.com/originals/7e/55/84/7e558432c10a4c64fac6b09deda5a981.jpg'),
          fadeInDuration: Duration(milliseconds: 300),
        ),
      ),
    );
  }
}