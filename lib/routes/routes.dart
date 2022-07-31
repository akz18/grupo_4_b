import 'package:flutter/material.dart';
import 'package:grupo_4_b/models/menu_option.dart';
import 'package:grupo_4_b/screens/factura_list_screen.dart';
import 'package:grupo_4_b/screens/home_screen.dart';

class AppRoutes {
  static const initialRoute = 'home';

  static final menuOptions = <MenuOption>[
    MenuOption(
        route: 'home',
        icon: Icons.home,
        name: 'Home Screen',
        screen: const HomeScreen()),
    MenuOption(
        route: 'factura-list',
        icon: Icons.list,
        name: 'Factura List',
        screen: const FacturaListScreen()),
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> routes = {};

    for (final menuOption in menuOptions) {
      routes.addAll(
          {menuOption.route: (BuildContext context) => menuOption.screen});
    }
    return routes;
  }
}
