import 'package:flutter/material.dart';
import 'package:grupo_4_b/routes/routes.dart';
import 'package:grupo_4_b/themes/theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final menuOptions = AppRoutes.menuOptions;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Página Principal')
      ),
      body: ListView.separated(
          itemBuilder: (context, index) => ListTile(
                leading: Icon(menuOptions[index].icon,color: AppTheme.primary),
                title: Text(menuOptions[index].name),
                onTap: () {
                  Navigator.pushNamed(context, menuOptions[index].route);
                },
              ),
          separatorBuilder: (_, __) => const Divider(),
          itemCount: menuOptions.length),
    );
  }
}