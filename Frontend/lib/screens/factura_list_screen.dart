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
        title: const Text('Factura List'),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) => Card(
                color: const Color.fromARGB(255, 205, 212, 212),
                margin: const EdgeInsets.only(right: 50, left: 50, top: 10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                elevation: 30,
                shadowColor: AppTheme.primary.withOpacity(0.5),
                child: Column(children: [
                  Container(
                    padding: const EdgeInsets.only(right: 15, top: 10),
                    alignment: AlignmentDirectional.topEnd,
                    child: Text(
                    facturaProvider.facturas[index].fecha.toString(),
                    style: const TextStyle(
                     color: Colors.black, fontSize: 15.0)),
                  ),
                  Card(
                    color: const Color.fromARGB(255, 225, 235, 235),
                    margin:
                        const EdgeInsets.only(left: 10, right: 200, top: 10),
                    child: Column(children: [
                      Container(
                        padding: const EdgeInsets.only(left: 15, top: 10),
                        alignment: AlignmentDirectional.topStart,
                        child: Text(
                          facturaProvider.facturas[index].cliente,
                          style: const TextStyle(
                              color: Colors.black, fontSize: 20.0),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 15, top: 10),
                        alignment: AlignmentDirectional.topStart,
                        child: Text(
                          "Producto: " +
                              facturaProvider.facturas[index].producto,
                          style: const TextStyle(
                              color: Colors.black, fontSize: 15.0),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 15, top: 10),
                        child: Row(
                          children: [
                            const Text(
                              "Cantidad: ",
                              style: TextStyle(
                                  color: Colors.black, fontSize: 15.0),
                            ),
                            Text(
                              textAlign: TextAlign.end,
                              facturaProvider.facturas[index].cantidad
                                  .toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 15.0),
                            )
                          ],
                        ),
                      ),
                    ]),
                  ),
                  Container(
                    padding: const EdgeInsets.only(right: 15, bottom: 10),
                    alignment: AlignmentDirectional.topEnd,
                    child: Column(
                      children: [
                        const Text(
                          "Total ",
                          style:
                              TextStyle(color: Colors.indigo, fontSize: 15.0),
                        ),
                        Text(
                          "USD ${facturaProvider.facturas[index].total} " ,
                              
                          style: const TextStyle(
                              color: Colors.black, fontSize: 15.0),
                        )
                      ],
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        facturaProvider.selectedFactura =
                            facturaProvider.facturas[index];
                        Navigator.pushNamed(context, 'factura-form');
                      },
                      child: Text(
                        "Visualizar",
                        style: TextStyle(color: Colors.black, fontSize: 20.0),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromARGB(255, 216, 250, 27)),
                      )),
                ]),
              ),
          separatorBuilder: (_, __) => const Divider(),
          itemCount: facturaProvider.facturas.length),
    );
  }
}
