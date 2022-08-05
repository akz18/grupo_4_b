import 'package:flutter/material.dart';
import 'package:grupo_4_b/providers/providers.dart';
import 'package:grupo_4_b/themes/theme.dart';
import 'package:grupo_4_b/widgets/widgets.dart';
import 'package:provider/provider.dart';

class FacturaFormScreen extends StatelessWidget {
  const FacturaFormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();
    final facturasProvider = Provider.of<FacturasProvider>(context);

    return ChangeNotifierProvider(
      create: (_) => FacturaFormProvider(facturasProvider.selectedFactura),
      child: FacturaFormScreenBody(
        facturasProvider: facturasProvider,
      ),
    );
  }
}

class FacturaFormScreenBody extends StatelessWidget {
  final FacturasProvider facturasProvider;
  const FacturaFormScreenBody({Key? key, required this.facturasProvider})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final facturaFormProvider = Provider.of<FacturaFormProvider>(context);
    final factura = facturaFormProvider.factura;
    final Map<String, dynamic> myFormValues = {
      //'fecha': factura.fecha.toString(),
      'id': factura.id,
      'cliente': factura.cliente,
      'producto': factura.producto,
      // 'precio': factura.precio,
      //'cantidad': factura.cantidad,
      //'archivado': factura.archivado,
      'firma': factura.firma,
      // 'total': factura.total,
    };
    return Scaffold(
        appBar: AppBar(
          title: const Text('Factura Form'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Form(
              key: facturaFormProvider.formKey,
              child: Column(children: [
                //CustomInputField(
                //initialValue: factura.fecha.toString(),
                //formProperty: 'fecha',
                //formValues: myFormValues,
                //labelText: 'Fecha',
                //autofocus: true,
                //suffixIcon: Icons.date_range),
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
                // CustomInputField(
                //   initialValue: factura.precio.toString(),
                //   formProperty: 'precio',
                //   formValues: myFormValues,
                //   labelText: 'Precio',
                //   suffixIcon: Icons.price_change_rounded,
                //   keyboardType: TextInputType.emailAddress,
                // ),
                // CustomInputField(
                //   initialValue: factura.cantidad.toString(),
                //   formProperty: 'cantidad',
                //   formValues: myFormValues,
                //   labelText: 'Cantidad',
                //   suffixIcon: Icons.add_circle,
                // ),
                CustomInputField(
                  initialValue: factura.firma,
                  formProperty: 'firma',
                  formValues: myFormValues,
                  labelText: 'Firma',
                  suffixIcon: Icons.confirmation_number,
                ),
                // CustomInputField(
                //   initialValue: factura.total.toString(),
                //   formProperty: 'total',
                //   formValues: myFormValues,
                //   labelText: 'Total',
                //   suffixIcon: Icons.scale,
                // ),
                DropdownButtonFormField<String>(
                    items: const [
                      DropdownMenuItem(value: 'True', child: Text('SI')),
                      DropdownMenuItem(value: 'False', child: Text('NO')),
                    ],
                    onChanged: (value) {
                      myFormValues['archivado'] = value ?? '';
                    }),
                ElevatedButton.icon(
                  onPressed: () {
                    factura.id = myFormValues['id'] ?? '';
                    factura.cliente = myFormValues['cliente'] ?? '';
                    factura.producto = myFormValues['producto'] ?? '';
                    //factura.precio = myFormValues['precio'] ?? 0;
                    //factura.cantidad = myFormValues['cantidad'] ?? 0;
                    //factura.archivado = myFormValues['archivado'] ?? '';
                    factura.firma = myFormValues['firma'] ?? '';
                    //factura.total = myFormValues['total'] ?? 0;
                    facturasProvider.saveOrUpdate(factura);
                    print(factura.id);
                  },
                  icon: const Icon(Icons.save),
                  label: const Text('Guardar'),
                )
              ]),
            ),
          ),
        ));
  }
}
