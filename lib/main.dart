import 'package:animated_do_app/src/pages/navegacion_page.dart';
import 'package:animated_do_app/src/pages/pagina1_page.dart';
// import 'package:animated_do_app/src/pages/twitter_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animate_do',
      debugShowCheckedModeBanner: false,
      home: NavegacionPage(),
    );
  }
}
