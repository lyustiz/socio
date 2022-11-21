import 'package:socio/providers/dto/figura_dto.dart';
import 'package:socio/providers/dto/recaudos_totales_dto.dart';
import 'package:socio/providers/dto/vendedor_cobro_dto.dart';
import 'package:socio/utils/db/json_serializer.dart';

class InformeJuegoDto {
  final int numeroJuego; //: 1,
  final DateTime fechaHoraInicio; //: "2022-06-04T14:23:44",
  final String nombreSerie; //: "Serie A Rombo",
  final int cartonInicial; //: 1,
  final int cartonFinal; //: 3060,
  final double valorCarton; //: 1,
  final double valorModulo; //: 0,
  final double totalPremios; //: 1800,
  final int totalCartones; //: 0,
  final double asistenciaSocial; //: 0,
  final double cuentasXCobrar; //: 1218.5,
  final double totalVentas; //: 0,
  final double totalRecaudos; //: 180,
  final double totalRecaudoCalculado; //: 1398.5,
  final double totalDiferencia; //: -1218.5,
  final double faltante; //: -1218.5,
  final double efectivo; //: 438.5,
  final double banco; //: 960,
  final double sobrante; //: -1218.5,
  final double totalIngresos; //: 0,
  final double sumIngresos; //: 0,
  final double sumGastos; //: 0,
  final double totalGastos; //: 0,
  final double resultadoFinal; //: 0,
  final double resultadoGeneral; //: 0,
  final double totalRecaudoUsuario; //: 1398.5,
  final double totalDiferenciaUsuario; //: -1218.5,
  final int sumTotalCartones; //: 180,
  final double sumCartonesCortesia; //: 0,
  final double sumTotalModulos; //: 0,
  final double sumTotalVentas; //: 180,
  final int sumCartonesDevueltos; //: 0,
  final double sumGastoCortesia; //: 0,
  final double sumValorComision; //: 54,
  final double sumAbonos; //: 0,
  final double sumFaltante; //: 0,
  final double sumTotalRecibido; //: 126,
  final double sumVentaTotalCartones; //: 180,
  final List<FiguraDto> listaFiguras;
  final List<RecaudosTotalesDto> listaRecaudoTotales;
  final List<VendedorCobroDto> listaVendedoresCobroCartones;

  InformeJuegoDto(
      {required this.numeroJuego,
      required this.fechaHoraInicio,
      required this.nombreSerie,
      required this.cartonInicial,
      required this.cartonFinal,
      required this.valorCarton,
      required this.valorModulo,
      required this.totalPremios,
      required this.totalCartones,
      required this.asistenciaSocial,
      required this.cuentasXCobrar,
      required this.totalVentas,
      required this.totalRecaudos,
      required this.totalRecaudoCalculado,
      required this.totalDiferencia,
      required this.faltante,
      required this.efectivo,
      required this.banco,
      required this.sobrante,
      required this.totalIngresos,
      required this.sumIngresos,
      required this.sumGastos,
      required this.totalGastos,
      required this.resultadoFinal,
      required this.resultadoGeneral,
      required this.totalRecaudoUsuario,
      required this.totalDiferenciaUsuario,
      required this.sumTotalCartones,
      required this.sumCartonesCortesia,
      required this.sumTotalModulos,
      required this.sumTotalVentas,
      required this.sumCartonesDevueltos,
      required this.sumGastoCortesia,
      required this.sumValorComision,
      required this.sumAbonos,
      required this.sumFaltante,
      required this.sumTotalRecibido,
      required this.sumVentaTotalCartones,
      required this.listaFiguras,
      required this.listaRecaudoTotales,
      required this.listaVendedoresCobroCartones});

  factory InformeJuegoDto.fromJson(Map<String, dynamic> json) {
    var serializer = const JsonSerializer();

    List<FiguraDto> listaFiguras = [];
    List<RecaudosTotalesDto> listaRecaudoTotales = [];
    List<VendedorCobroDto> listaVendedoresCobroCartones = [];

    for (var figuraJson in (json['listaFiguras'] as List)) {
      listaFiguras.add(FiguraDto.fromJson(figuraJson));
    }
    for (var recaudoTotalJson in (json['listaRecaudoTotales'] as List)) {
      listaRecaudoTotales.add(RecaudosTotalesDto.fromJson(recaudoTotalJson));
    }

    for (var vendedoresCobroJson
        in (json['listaVendedoresCobroCartones'] as List)) {
      listaVendedoresCobroCartones
          .add(VendedorCobroDto.fromJson(vendedoresCobroJson));
    }

    return InformeJuegoDto(
        numeroJuego: serializer.fromJson<int>(json['numeroJuego']),
        fechaHoraInicio: DateTime.parse(
            serializer.fromJson<String>(json['fechaHoraInicio'])),
        nombreSerie: serializer.fromJson<String>(json['nombreSerie']),
        cartonInicial: serializer.fromJson<int>(json['cartonInicial']),
        cartonFinal: serializer.fromJson<int>(json['cartonFinal']),
        valorCarton: serializer.fromJson<double>(json['valorCarton']),
        valorModulo: serializer.fromJson<double>(json['valorModulo']),
        totalPremios: serializer.fromJson<double>(json['totalPremios']),
        totalCartones: serializer.fromJson<int>(json['totalCartones']),
        asistenciaSocial: serializer.fromJson<double>(json['asistenciaSocial']),
        cuentasXCobrar: serializer.fromJson<double>(json['cuentasXCobrar']),
        totalVentas: serializer.fromJson<double>(json['totalVentas']),
        totalRecaudos: serializer.fromJson<double>(json['totalRecaudos']),
        totalRecaudoCalculado:
            serializer.fromJson<double>(json['totalRecaudoCalculado']),
        totalDiferencia: serializer.fromJson<double>(json['totalDiferencia']),
        faltante: serializer.fromJson<double>(json['faltante']),
        efectivo: serializer.fromJson<double>(json['efectivo']),
        banco: serializer.fromJson<double>(json['banco']),
        sobrante: serializer.fromJson<double>(json['sobrante']),
        totalIngresos: serializer.fromJson<double>(json['totalIngresos']),
        sumIngresos: serializer.fromJson<double>(json['sumIngresos']),
        sumGastos: serializer.fromJson<double>(json['sumGastos']),
        totalGastos: serializer.fromJson<double>(json['totalGastos']),
        resultadoFinal: serializer.fromJson<double>(json['resultadoFinal']),
        resultadoGeneral: serializer.fromJson<double>(json['resultadoGeneral']),
        totalRecaudoUsuario:
            serializer.fromJson<double>(json['totalRecaudoUsuario']),
        totalDiferenciaUsuario:
            serializer.fromJson<double>(json['totalDiferenciaUsuario']),
        sumTotalCartones: serializer.fromJson<int>(json['sumTotalCartones']),
        sumCartonesCortesia:
            serializer.fromJson<double>(json['sumCartonesCortesia']),
        sumTotalModulos: serializer.fromJson<double>(json['sumTotalModulos']),
        sumTotalVentas: serializer.fromJson<double>(json['sumTotalVentas']),
        sumCartonesDevueltos:
            serializer.fromJson<int>(json['sumCartonesDevueltos']),
        sumGastoCortesia: serializer.fromJson<double>(json['sumGastoCortesia']),
        sumValorComision: serializer.fromJson<double>(json['sumValorComision']),
        sumAbonos: serializer.fromJson<double>(json['sumAbonos']),
        sumFaltante: serializer.fromJson<double>(json['sumFaltante']),
        sumTotalRecibido: serializer.fromJson<double>(json['sumTotalRecibido']),
        sumVentaTotalCartones:
            serializer.fromJson<double>(json['sumVentaTotalCartones']),
        listaFiguras: listaFiguras,
        listaRecaudoTotales: listaRecaudoTotales,
        listaVendedoresCobroCartones: listaVendedoresCobroCartones);
  }
}
