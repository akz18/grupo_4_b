import 'package:flutter/material.dart';
import 'package:grupo_4_b/models/models.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FacturasProvider extends ChangeNotifier {
  final String _baseUrl = 'localhost:3000';
  final List<Factura> facturas = [];
  Factura factura = Factura(
    fecha: DateTime(0),
    cliente: '',
    producto: '',
    precio: 0,
    cantidad: 0,
    archivado: '',
    total: 0,
  );

  FacturasProvider() {
    getFacturas();
  }

  Future<List<Factura>> getFacturas() async {
    var url = Uri.http(_baseUrl, 'Facturas');
    var response = await http.get(url);
    List<dynamic> facturasList = json.decode(response.body);
    facturasList.forEach((factura) {
      final facturaTemp = Factura.fromMap(factura);
      facturas.add(facturaTemp);
    });
    return facturas;
  }

  Future<Factura> getFactura() async {
    var url = Uri.http(_baseUrl, 'facturas/1');
    var response = await http.get(url);

    Map<String, dynamic> facturaMap = json.decode(response.body);

    factura.fecha = facturaMap['fecha'];
    factura.cliente = facturaMap['cliente'];
    factura.producto = facturaMap['producto'];
    factura.precio = facturaMap['precio'];
    factura.cantidad = facturaMap['cantidad'];
    factura.archivado = facturaMap['archivado'];
    factura.total = facturaMap['total'];

    // FacturaMap.forEach((key, value) {
    //   final FacturaTemp = Factura.fromMap(value);
    //   Factura Factura = Factura(FacturaTemp);
    // });

    // print(Factura.toMap());

    return factura;
  }

  createFactura() {}

  updateFactura() {}

  deleteFactura() {}
}
