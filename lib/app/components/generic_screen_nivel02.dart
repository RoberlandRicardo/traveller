import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:traveller/app/styles/custom_text.dart';
import 'package:traveller/app/views/home.dart';

class GenericScreen extends StatelessWidget {
  final Widget child;
  final int currendIndex;

  GenericScreen({required this.child, required this.currendIndex});

  static const List<String> _pages = <String>[
    '/home',
    '/travel',
    '/perfil',
  ];

  static const List<String> _topBarNames = <String>[
    'Home',
    'Viagens',
    'Perfil',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: currendIndex > 0
            ? AppBar(
                title: Text(
                  _topBarNames[currendIndex],
                  style: CustomText.topBar,
                ),
                backgroundColor: Theme.of(context).colorScheme.primary,
              )
            : null,
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: child,
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Color.fromRGBO(108, 129, 165, 1),
          unselectedItemColor: Color.fromRGBO(108, 129, 165, 1),
          backgroundColor: Color.fromRGBO(5, 41, 60, 1),
          currentIndex: currendIndex,
          onTap: (index) {
            Navigator.pushReplacementNamed(context, _pages[index]);
          },
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
                size: 32,
              ),
              activeIcon: Icon(
                Icons.home,
                size: 32,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_repair_service_outlined,
                size: 32,
              ),
              activeIcon: Icon(
                Icons.home_repair_service,
                size: 32,
              ),
              label: 'Viagem',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline,
                size: 32,
              ),
              activeIcon: Icon(
                Icons.person,
                size: 32,
              ),
              label: 'Perfil',
            ),
          ],
        ),
        backgroundColor: Theme.of(context).colorScheme.background);
  }
}
