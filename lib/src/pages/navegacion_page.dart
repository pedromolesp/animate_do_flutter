import 'package:animate_do/animate_do.dart';
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
    final int numero =
        Provider.of<_NotificationModel>(context, listen: false).numero;
    return Builder(
      builder: (context) {
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
                      child: BounceInDown(
                        from: 10,
                        animate: numero > 0,
                        child: Bounce(
                          from: 10,
                          controller: (controller) =>
                              Provider.of<_NotificationModel>(context)
                                  .bounceController = controller,
                          child: Container(
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                                color: Colors.redAccent,
                                shape: BoxShape.circle),
                            child: Text(
                              '$numero',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 8),
                            ),
                            alignment: Alignment.center,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              BottomNavigationBarItem(
                  label: "My Dog ", icon: FaIcon(FontAwesomeIcons.dog))
            ]);
      },
    );
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
        final notimodel =
            Provider.of<_NotificationModel>(context, listen: false);
        int numero = notimodel.numero;
        numero++;
        notimodel.numero = numero;
        if (numero >= 2) {
          final controller = notimodel.bounceController;
          controller.forward(from: 0.0);
        }
      },
    );
  }
}

class _NotificationModel extends ChangeNotifier {
  AnimationController _bounceController;
  int _numero = 0;
  int get numero => this._numero;
  set numero(int valor) {
    this._numero = valor;
    notifyListeners();
  }

  AnimationController get bounceController => this._bounceController;
  set bounceController(AnimationController controller) {
    this._bounceController = controller;
    notifyListeners();
  }
}
