import 'package:flutter/material.dart';
import 'package:traveller/app/views/home.dart';

class TabContainer extends StatefulWidget {
  const TabContainer({Key? key}) : super(key: key);

  @override
  _TabContainerState createState() => _TabContainerState();
}

class _TabContainerState extends State<TabContainer> {
  int _selectedIndex = 0;
  var listNameAppBar = ['Home', 'Viagem', 'Feed', 'Perfil'];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<Widget> _pages = <Widget>[
    Home(),
    Home(),
    Home(),
    Home(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _selectedIndex == 0
          ? null
          : AppBar(
              iconTheme: IconThemeData(color: Color.fromRGBO(224, 224, 224, 1)),
              title: Text(
                listNameAppBar[_selectedIndex],
                style: TextStyle(
                    color: Color.fromRGBO(224, 224, 224, 1),
                    fontWeight: FontWeight.bold),
              )),
      backgroundColor: Color.fromRGBO(245, 170, 82, 1),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color.fromRGBO(108, 129, 165, 1),
        unselectedItemColor: Color.fromRGBO(108, 129, 165, 1),
        backgroundColor: Color.fromRGBO(19, 19, 19, 1),
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_repair_service_outlined),
            activeIcon: Icon(Icons.home_repair_service),
            label: 'Viagem',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today_outlined),
            activeIcon: Icon(Icons.calendar_today),
            label: 'Feed',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}
