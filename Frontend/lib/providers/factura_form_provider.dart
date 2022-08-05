import 'package:flutter/material.dart';
import 'package:grupo_4_b/models/models.dart';

class FacturaFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  Factura factura;
  FacturaFormProvider(this.factura);
}
