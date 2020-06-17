import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:componentes_practica/src/routes/routes.dart';
import 'package:componentes_practica/src/pages/alert_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
       supportedLocales: [
        const Locale('en'), // English
        const Locale('es'), // Español
      ],
      title: 'Componentes App',
     // home: HomePage(),
      initialRoute: '/',
      routes: getApplicationRoutes(),
      onGenerateRoute: (RouteSettings settings){
        return MaterialPageRoute(
          builder: (context) => AlertPage()
        );
      },
    );
  }
}