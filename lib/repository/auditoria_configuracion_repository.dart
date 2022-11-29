import 'package:socio/providers/api.dart';
import 'package:socio/providers/dto/auditoria_configuracion_dto.dart';

class AuditoriaConfiguracionRepository {
  Api api = Api();

  Map<String, dynamic> result = {'isSuccess': false, 'data': null};

  Future<List<AuditoriaConfiguracionDto>> getAuditoria(
      {required int idProgramacionJuego}) async {
    var params = {'IdProgramacionJuego': '$idProgramacionJuego'};

    try {
      result = await api.getData('auditoriaconfiguracion', params);
    } catch (e) {
      return [];
    }

    List<AuditoriaConfiguracionDto> auditoriaDto = [];

    if (result['isSuccess']) {
      List data = result['data'];

      for (var auditoria in data) {
        auditoriaDto.add(AuditoriaConfiguracionDto.fromJson(auditoria));
      }
    }

    return auditoriaDto;
  }
}
