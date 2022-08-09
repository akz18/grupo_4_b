import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grupo_4_b/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:grupo_4_b/models/factura.dart';
import 'package:grupo_4_b/providers/providers.dart';
import 'package:grupo_4_b/themes/theme.dart';
import 'package:grupo_4_b/widgets/widgets.dart';
import 'package:provider/provider.dart';

class FacturaFormCreate extends StatelessWidget {
  const FacturaFormCreate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();
    final facturasProvider = Provider.of<FacturasProvider>(context);
    return ChangeNotifierProvider(
      create: (_) => FacturaFormProvider(facturasProvider.factura),
      child: FacturaFormCreateBody(
        facturasProvider: facturasProvider,
      ),
    );
  }
}

class FacturaFormCreateBody extends StatelessWidget {
  final FacturasProvider facturasProvider;
  const FacturaFormCreateBody({Key? key, required this.facturasProvider})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final facturaFormProvider = Provider.of<FacturaFormProvider>(context);
    final factura = facturaFormProvider.factura;
    final Map<String, dynamic> myFormValues = {
      'id': factura.id,
      'fecha': factura.fecha,
      'cliente': factura.cliente,
      'producto': factura.producto,
      'precio': factura.precio,
      'cantidad': factura.cantidad,
      'archivado': factura.archivado,
      'firma': factura.firma,
      'total': factura.total,
    };

    return Scaffold(
        appBar: AppBar(
          title: const Text('Factura Form'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            key: facturaFormProvider.formKey,
            child: Form(
              child: Column(children: [
                
                CustomInputField(
                    initialValue: factura.cliente,
                    formProperty: 'cliente',
                    formValues: myFormValues,
                    labelText: 'Nombre Cliente',
                    hintText: 'Escriba su nombre',
                    helperText: 'Solo letras',
                    suffixIcon: Icons.people),
                CustomInputField(
                  initialValue: factura.producto,
                  formProperty: 'producto',
                  formValues: myFormValues,
                  labelText: 'Producto',
                  hintText: 'Ingrese el producto',
                  suffixIcon: Icons.shopping_cart_checkout,
                ),
                CustomInputField(
                  initialValue: factura.precio.toString(),
                  formProperty: 'precio',
                  formValues: myFormValues,
                  labelText: 'Precio',
                  suffixIcon: Icons.price_change_rounded,
                  keyboardType: TextInputType.number,
                  tipoRespuesta: 'double',
                ),
                CustomInputField(
                  initialValue: factura.cantidad.toString(),
                  formProperty: 'cantidad',
                  formValues: myFormValues,
                  labelText: 'Cantidad',
                  suffixIcon: Icons.add_circle,
                  keyboardType: TextInputType.number,
                  tipoRespuesta: 'int',
                ),
                CustomInputField(
                  initialValue: factura.firma,
                  formProperty: 'firma',
                  formValues: myFormValues,
                  labelText: 'Firma',
                  suffixIcon: Icons.confirmation_number,
                ),
                
                /*CustomInputField(
                  initialValue: factura.total.toString(),
                  formProperty: 'total',
                  formValues: myFormValues,
                  labelText: 'Total',
                  suffixIcon: Icons.scale,
                  keyboardType: TextInputType.number,
                  tipoRespuesta: 'double',
                ),*/
                DateInputField(
                    formProperty: 'fecha',
                    formValues: myFormValues,
                    suffixIcon: Icons.date_range,
                    ),
                Container(
                    margin: EdgeInsets.only(
                        top: 10, bottom: 10, left: 20, right: 20),
                    width: 200,
                    height: 75,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.white, width: 3)),
                    child: Column(
                      children: [
                        const Text("Archivado", style: TextStyle(fontSize: 15)),
                        DropdownButtonFormField<bool>(
                            items: const [
                              DropdownMenuItem(
                                  value: true,
                                  child: Text(
                                    'SI',
                                  )),
                              DropdownMenuItem(
                                  value: false,
                                  child: Text(
                                    'NO',
                                  )),
                            ],
                            onChanged: (value) {
                              myFormValues['archivado'] = value;
                              print(value);
                            }),
                      ],
                    )),
                ElevatedButton.icon(
                  onPressed: () 
                   => showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('Se guardará la factura', textAlign: TextAlign.center),
                      content: const Text('¿Desea Continuar?', textAlign: TextAlign.center),
                      actions: <Widget>[
                        //Align(alignment: Alignment.center),
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'Cancel'),
                          child: Container(
                          padding: const EdgeInsets.only(
                        top: 10, bottom: 10, left: 10, right: 50),
                          child: const Text('Cancel', style: TextStyle(color: Colors.yellow)),
                          )
                        ),
                        TextButton(
                          onPressed: () {
                            factura.id = myFormValues['id'];
                            factura.fecha = myFormValues['fecha'] ?? DateTime.now();
                            factura.cliente = myFormValues['cliente'] ?? '';
                            factura.producto = myFormValues['producto'] ?? '';
                            factura.precio = myFormValues['precio'] ?? 0;
                            factura.cantidad = myFormValues['cantidad'] ?? 0;
                            factura.archivado = myFormValues['archivado'] ?? false;
                            factura.firma = myFormValues['firma'] ?? '';
                            factura.total = myFormValues['precio'] * myFormValues['cantidad'];
                            facturasProvider.saveOrUpdate(factura);
                            print(factura.id);
                            Navigator.pushNamed(context, 'home');
                          },
                          child: Container(
                          padding: const EdgeInsets.only(
                          top: 10, bottom: 10, left: 10, right: 60),
                          child: const Text('OK', style: TextStyle(color: Colors.yellow)),
                           )
                        ),
                      ],
                    ),
                  ),
                  icon: const Icon(Icons.save, color: Colors.black),
                  label: const Text(
                    'Guardar',
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromARGB(255, 216, 250, 27)),
                  ),
                )
              ]),
            ),
          ),
        ));
  }
}
