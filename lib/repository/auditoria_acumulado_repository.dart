import 'package:socio/providers/api.dart';
import 'package:socio/providers/dto/auditoria_acumulado_dto.dart';

class AuditoriaAcumuladoRepository {
  Api api = Api();

  Map<String, dynamic> result = {'isSuccess': false, 'data': null};

  Future<List<AuditoriaAcumuladoDto>> getAuditoria(
      {required int idProgramacionJuego}) async {
    var params = {'IdProgramacionJuego': '$idProgramacionJuego'};

    try {
      result = await api.getData('auditoriaacumulado', params);
    } catch (e) {
      return [];
    }

    List<AuditoriaAcumuladoDto> auditoriaDto = [];

    if (result['isSuccess']) {
      List data = result['data'];

      for (var auditoria in data) {
        auditoriaDto.add(AuditoriaAcumuladoDto.fromJson(auditoria));
      }
    }

    return auditoriaDto;
  }
}
