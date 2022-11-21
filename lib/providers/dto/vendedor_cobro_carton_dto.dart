import 'package:socio/utils/db/json_serializer.dart';

class VendedorCobrocartonDto {
  final int idVendedorCobroCarton;
  final int idProgramacionJuego;
  final String nombreVendedor;
  final int totalCartones;
  final int ventaTotalCartones;
  final int cartonesDevueltos;
  final int numeroHojasEntregadas;
  final double porcentajeComision;
  final double totalVentas;
  final int cartonesCortesia;
  final double valorComision;
  final double abonos;
  final double totalPagado;
  final double faltante;
  final double totalRecibido;
  final double gastoCortesia;
  final double totalModulos;
  final String estado;
  final DateTime? fechaHora;
  final int? idUsuario;
  final DateTime? fechaCobroApp;

  VendedorCobrocartonDto(
      {required this.idVendedorCobroCarton,
      required this.idProgramacionJuego,
      required this.nombreVendedor,
      required this.totalCartones,
      required this.ventaTotalCartones,
      required this.cartonesDevueltos,
      required this.numeroHojasEntregadas,
      required this.porcentajeComision,
      required this.totalVentas,
      required this.cartonesCortesia,
      required this.valorComision,
      required this.abonos,
      required this.totalPagado,
      required this.faltante,
      required this.totalRecibido,
      required this.gastoCortesia,
      required this.totalModulos,
      required this.estado,
      this.fechaHora,
      this.idUsuario,
      this.fechaCobroApp});

  factory VendedorCobrocartonDto.fromJson(Map<String, dynamic> json) {
    var serializer = const JsonSerializer();
    return VendedorCobrocartonDto(
      idVendedorCobroCarton:
          serializer.fromJson<int>(json['idVendedorCobroCarton']),
      idProgramacionJuego:
          serializer.fromJson<int>(json['idProgramacionJuego']),
      nombreVendedor: serializer.fromJson<String>(json['nombreVendedor']),
      totalCartones: serializer.fromJson<int>(json['totalCartones']),
      cartonesDevueltos: serializer.fromJson<int>(json['cartonesDevueltos']),
      ventaTotalCartones: serializer.fromJson<int>(json['ventaTotalCartones']),
      numeroHojasEntregadas:
          serializer.fromJson<int>(json['numeroHojasEntregadas']),
      porcentajeComision:
          serializer.fromJson<double>(json['porcentajeComision']),
      totalVentas: serializer.fromJson<double>(json['totalVentas']),
      cartonesCortesia: serializer.fromJson<int>(json['cartonesCortesia']),
      valorComision: serializer.fromJson<double>(json['valorComision']),
      abonos: serializer.fromJson<double>(json['abonos']),
      totalPagado: serializer.fromJson<double>(json['totalPagado']),
      faltante: serializer.fromJson<double>(json['faltante']),
      totalRecibido: serializer.fromJson<double>(json['totalRecibido']),
      gastoCortesia: serializer.fromJson<double>(json['gastoCortesia']),
      totalModulos: serializer.fromJson<double>(json['totalModulos']),
      estado: serializer.fromJson<String>(json['estado']),
      fechaHora: serializer.fromJson<DateTime>(json['fechaHora']),
      idUsuario: serializer.fromJson<int>(json['idUsuario']),
      fechaCobroApp: serializer.fromJson<DateTime>(json['fechaCobroApp']),
    );
  }
}
