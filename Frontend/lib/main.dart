import 'package:flutter/material.dart';
import 'package:grupo_4_b/providers/factura_provider.dart';
import 'package:grupo_4_b/routes/routes.dart';
import 'package:grupo_4_b/themes/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => FacturasProvider(),
          lazy: false,
        )
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Desarrollo de Aplicaciones Móviles',
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.getAppRoutes(),
      theme:
      ////////////Poner en Theme.dart 
      ThemeData(
      colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      surface: Colors.yellow,
      onSurface: Colors.black,
      // Colors that are not relevant to AppBar in DARK mode:
      primary: Colors.grey,
      onPrimary: Colors.grey,
      primaryVariant: Colors.grey,
      secondary: Colors.grey,
      secondaryVariant: Colors.grey,
      onSecondary: Colors.grey,
      background: Colors.grey,
      onBackground: Colors.grey,
      error: Colors.grey,
      onError: Colors.grey,
    ),
      ),
    );
  }
}
