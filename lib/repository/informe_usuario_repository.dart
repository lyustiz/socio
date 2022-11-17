import 'package:socio/providers/api.dart';
import 'package:socio/providers/dto/informe_caja_usuario_dto.dart';

class InformeUsuarioRepository {
  Api api = Api();

  Map<String, dynamic> result = {'isSuccess': false, 'data': null};

  Future<InformeCajaUsuarioDto?> getInformeUsuario(
      {required int idProgramacionJuego, required int idUsuario}) async {
    var params = {
      'idProgramacionJuego': '$idProgramacionJuego',
      'idUsuario': '$idUsuario'
    };

    try {
      result = await api.getData('informecajausuario', params);
    } catch (e) {
      return null;
    }

    InformeCajaUsuarioDto? informeDto;

    if (result['isSuccess']) {
      informeDto = InformeCajaUsuarioDto.fromJson(result['data']);
    }

    return informeDto;
  }
}
