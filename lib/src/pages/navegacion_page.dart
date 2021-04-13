import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class NavegacionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _NotificationModel(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          centerTitle: true,
          title: Text("Notifications page"),
        ),
        floatingActionButton: BotonFlotante(),
        bottomNavigationBar: BottomNavigation(),
      ),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final int numero = Provider.of<_NotificationModel>(context).numero;
    return BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.pink,
        items: [
          BottomNavigationBarItem(
              label: "Bones ", icon: FaIcon(FontAwesomeIcons.bone)),
          BottomNavigationBarItem(
            label: "Notifications ",
            icon: Stack(
              children: [
                FaIcon(FontAwesomeIcons.bell),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                        color: Colors.redAccent, shape: BoxShape.circle),
                    child: Text(
                      '$numero',
                      style: TextStyle(color: Colors.white, fontSize: 8),
                    ),
                    alignment: Alignment.center,
                  ),
                )
              ],
            ),
          ),
          BottomNavigationBarItem(
              label: "My Dog ", icon: FaIcon(FontAwesomeIcons.dog))
        ]);
  }
}

class BotonFlotante extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: FaIcon(
        FontAwesomeIcons.play,
      ),
      backgroundColor: Colors.pink,
      onPressed: () {
        int numero =
            Provider.of<_NotificationModel>(context, listen: false).numero;
        numero++;
        Provider.of<_NotificationModel>(context, listen: false).numero = numero;
      },
    );
  }
}

class _NotificationModel extends ChangeNotifier {
  int _numero = 0;
  int get numero => this._numero;
  set numero(int valor) {
    this.numero = valor;
    notifyListeners();
  }
}
