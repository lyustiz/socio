import 'package:socio/models/flujos_caja.dart';
import 'package:socio/utils/db/json_serializer.dart';

class FlujosCajaDto {
  final int idFlujoCaja;
  final int idProgramacionJuego;
  final double valorInicial;
  final double valorFinal;
  final double valorInicialBancos;
  final double valorFinalBancos;
  final double valorInicialSocial;
  final double valorFinalSocial;
  final String estado;

  FlujosCajaDto(
      {required this.idFlujoCaja,
      required this.idProgramacionJuego,
      required this.valorInicial,
      required this.valorFinal,
      required this.valorInicialBancos,
      required this.valorFinalBancos,
      required this.valorInicialSocial,
      required this.valorFinalSocial,
      required this.estado});

  factory FlujosCajaDto.fromJson(Map<String, dynamic> json) {
    var serializer = const JsonSerializer();

    return FlujosCajaDto(
      idFlujoCaja: serializer.fromJson<int>(json['idFlujoCaja']),
      idProgramacionJuego:
          serializer.fromJson<int>(json['idProgramacionJuego']),
      valorInicial: serializer.fromJson<double>(json['valorInicial']),
      valorFinal: serializer.fromJson<double>(json['valorFinal']),
      valorInicialBancos:
          serializer.fromJson<double>(json['valorInicialBancos']),
      valorFinalBancos: serializer.fromJson<double>(json['valorFinalBancos']),
      valorInicialSocial:
          serializer.fromJson<double>(json['valorInicialSocial']),
      valorFinalSocial: serializer.fromJson<double>(json['valorFinalSocial']),
      estado: serializer.fromJson<String>(json['estado']),
    );
  }

  static FlujosCaja toRecaudosTotales(FlujosCajaDto flujosCajaDto) {
    return FlujosCaja(
      idFlujoCaja: flujosCajaDto.idFlujoCaja,
      idProgramacionJuego: flujosCajaDto.idProgramacionJuego,
      valorInicial: flujosCajaDto.valorInicial,
      valorFinal: flujosCajaDto.valorFinal,
      valorInicialBancos: flujosCajaDto.valorInicialBancos,
      valorFinalBancos: flujosCajaDto.valorFinalBancos,
      valorInicialSocial: flujosCajaDto.valorInicialSocial,
      valorFinalSocial: flujosCajaDto.valorFinalSocial,
      estado: flujosCajaDto.estado,
    );
  }
}
