import 'package:flutter/material.dart';
import 'package:grupo_4_b/providers/factura_provider.dart';
import 'package:grupo_4_b/themes/theme.dart';
import 'package:provider/provider.dart';

class FacturaListScreen extends StatelessWidget {
  const FacturaListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final facturaProvider = Provider.of<FacturasProvider>(context);
    print(facturaProvider.facturas.length);
    print(facturaProvider.facturas[0].producto);
    return Scaffold(
      appBar: AppBar(
        title: const Text('User List'),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) => ListTile(
                leading: const Icon(Icons.people, color: AppTheme.primary),
                title: Text(facturaProvider.facturas[index].cliente),
                onTap: () {
                  Navigator.pushNamed(context, 'factura-form');
                },
              ),
          separatorBuilder: (_, __) => const Divider(),
          itemCount: facturaProvider.facturas.length),
    );
  }
}
