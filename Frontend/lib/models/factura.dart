import 'dart:convert';

class Factura {
    Factura({
        this.id,
        required this.fecha,
        required this.cliente,
        required this.producto,
        required this.precio,
        required this.cantidad,
        required this.archivado,
        this.firma,
        required this.total,
    });

    int? id;
    DateTime fecha;
    String cliente;
    String producto;
    double precio;
    int cantidad;
    String archivado;
    String? firma;
    double total;

    factory Factura.fromJson(String str) => Factura.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Factura.fromMap(Map<String, dynamic> json) => Factura(
        id: json["id"],
        fecha: DateTime.parse(json["fecha"]),
        cliente: json["cliente"],
        producto: json["producto"],
        precio: json["precio"].toDouble(),
        cantidad: json["cantidad"],
        archivado: json["archivado"],
        firma: json["firma"],
        total: json["total"].toDouble(),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "fecha": "${fecha.year.toString().padLeft(4, '0')}-${fecha.month.toString().padLeft(2, '0')}-${fecha.day.toString().padLeft(2, '0')}",
        "cliente": cliente,
        "producto": producto,
        "precio": precio,
        "cantidad": cantidad,
        "archivado": archivado,
        "firma": firma,
        "total": total,
    };
}
