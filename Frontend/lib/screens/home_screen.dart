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
          centerTitle: true,
          title: Stack(
            children: <Widget>[
              Text(
                'Pagina Principal',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 6
                    ..color = Color.fromARGB(255, 39, 37, 37),
                ),
              ),
              const Text(
                'Pagina Principal',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ],
          )),
      drawer: Drawer(
        child: ListView.separated(
            itemBuilder: (context, index) => ListTile(
                  leading: Icon(menuOptions[index].icon,
                      color: Color.fromARGB(255, 216, 250, 27)),
                  title: Text(menuOptions[index].name),
                  onTap: () {
                    Navigator.pushNamed(context, menuOptions[index].route);
                  },
                ),
            separatorBuilder: (_, __) => const Divider(),
            itemCount: menuOptions.length),
      ),
      body: const Image(
        image: AssetImage('assets/images/factura1.jpg'),
        alignment: AlignmentDirectional.bottomEnd,
      ),
    );
  }
}
