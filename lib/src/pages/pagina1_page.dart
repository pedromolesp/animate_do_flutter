import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Pagina1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animate do"),
        actions: [
          IconButton(icon: FaIcon(FontAwesomeIcons.twitter), onPressed: () {}),
          IconButton(icon: Icon(Icons.navigate_next), onPressed: () {}),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: FaIcon(FontAwesomeIcons.play),
        onPressed: () {},
      ),
      body: Center(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
