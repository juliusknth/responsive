import 'package:flutter/material.dart';

class Navigation extends StatelessWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => NavigationRail(
        leading: Column(
          children: [
            const FlutterLogo(),
            const SizedBox(
              height: 16.0,
            ),
            FloatingActionButton(
              onPressed: () {},
              child: const Icon(Icons.add),
            ),
          ],
        ),
        labelType: NavigationRailLabelType.all,
        destinations: const [
          NavigationRailDestination(
            icon: Icon(Icons.insights_outlined),
            selectedIcon: Icon(Icons.insights),
            label: Text('Inventory'),
          ),
          NavigationRailDestination(
            icon: Icon(Icons.trolley),
            selectedIcon: Icon(Icons.trolley),
            label: Text('Inbounds'),
          ),
          NavigationRailDestination(
            icon: Icon(Icons.shopping_cart_outlined),
            selectedIcon: Icon(Icons.shopping_cart),
            label: Text('Outbounds'),
          ),
          NavigationRailDestination(
            icon: Icon(Icons.undo_outlined),
            selectedIcon: Icon(Icons.undo),
            label: Text('Returns'),
          ),
          NavigationRailDestination(
            icon: Icon(Icons.group_outlined),
            selectedIcon: Icon(Icons.group),
            label: Text('Users'),
          ),
          NavigationRailDestination(
            icon: Icon(Icons.warehouse_outlined),
            selectedIcon: Icon(Icons.warehouse),
            label: Text('Warehouses'),
          ),
          NavigationRailDestination(
            icon: Icon(Icons.settings_outlined),
            selectedIcon: Icon(Icons.settings),
            label: Text('Settings'),
          ),
        ],
        selectedIndex: 0,
      );
}

class Content extends StatelessWidget {
  const Content({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        color: Colors.green,
      );
}

class Sidebar extends StatelessWidget {
  const Sidebar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        color: Colors.blue,
      );
}

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.blue,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.insights_outlined),
            activeIcon: Icon(Icons.insights),
            label: 'Inventory',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.trolley),
            activeIcon: Icon(Icons.trolley),
            label: 'Inbounds',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            activeIcon: Icon(Icons.shopping_cart),
            label: 'Outbounds',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.undo_outlined),
            activeIcon: Icon(Icons.undo),
            label: 'Returns',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            activeIcon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: 1,
      );
}
