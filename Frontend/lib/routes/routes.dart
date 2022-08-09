import 'package:flutter/material.dart';
import 'package:grupo_4_b/models/menu_option.dart';
import 'package:grupo_4_b/screens/screens.dart';

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
    MenuOption(
        route: 'factura-form-create',
        icon: Icons.list,
        name: 'Factura Form Create',
        screen: const FacturaFormCreate()),
    MenuOption(
        route: 'factura-form',
        icon: Icons.list,
        name: 'Factura Form',
        screen: const FacturaFormScreen()),
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
