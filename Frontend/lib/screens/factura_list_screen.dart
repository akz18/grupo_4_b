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
          itemBuilder: (context, index) =>
              // ListTile(
              //       leading: const Icon(Icons.people, color: AppTheme.primary),
              //       title: Text(facturaProvider.facturas[index].cliente),
              //       onTap: () {
              //         Navigator.pushNamed(context, 'factura-form');
              //       },
              //     ),
              Card(
                color: Color.fromARGB(255, 205, 212, 212),
                margin: EdgeInsets.only(right: 50, left: 50, top: 10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                elevation: 30,
                shadowColor: AppTheme.primary.withOpacity(0.5),
                child: Column(children: [
                  Container(
                    padding: EdgeInsets.only(right: 15, top: 10),
                    alignment: AlignmentDirectional.topEnd,
                    child:
                        Text(facturaProvider.facturas[index].fecha.toString()),
                  ),
                  Card(
                    color: Color.fromARGB(255, 225, 235, 235),
                    margin: EdgeInsets.only(left: 10, right: 200, top: 10),
                    child: Column(children: [
                      Container(
                        padding: EdgeInsets.only(left: 15, top: 10),
                        alignment: AlignmentDirectional.topStart,
                        child: Text(
                          facturaProvider.facturas[index].cliente,
                          style: TextStyle(color: Colors.black, fontSize: 20.0),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 15, top: 10),
                        alignment: AlignmentDirectional.topStart,
                        child: Text(
                          "Producto: " +
                              facturaProvider.facturas[index].producto,
                          style: TextStyle(color: Colors.black, fontSize: 15.0),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 15, top: 10),
                        child: Row(
                          children: [
                            Text(
                              "Cantidad: ",
                              style: TextStyle(fontSize: 15.0),
                            ),
                            Text(
                              textAlign: TextAlign.end,
                              facturaProvider.facturas[index].cantidad
                                  .toString(),
                              style: TextStyle(fontSize: 15.0),
                            )
                          ],
                        ),
                      ),
                    ]),
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 15, bottom: 10),
                    alignment: AlignmentDirectional.topEnd,
                    child: Column(
                      children: [
                        Text(
                          "Total ",
                          style:
                              TextStyle(color: Colors.indigo, fontSize: 15.0),
                        ),
                        Text(
                          "USD  " +
                              facturaProvider.facturas[index].precio.toString(),
                          style: TextStyle(color: Colors.black, fontSize: 15.0),
                        )
                      ],
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () => null,
                      child: Text(
                        "Visualizar",
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.indigo),
                      )),
                ]),
              ),
          separatorBuilder: (_, __) => const Divider(),
          itemCount: facturaProvider.facturas.length),
    );
  }
}
