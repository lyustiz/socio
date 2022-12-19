import 'package:socio/providers/dto/configuracion_dto.dart';
import 'package:socio/providers/api.dart';

class ConfiguracionRepository {
  final Api api = Api();
  Map<String, dynamic> data = {};
  Map<String, dynamic> result = {'isSuccess': false, 'data': null};

  Future<ConfiguracionDto?> getConfiguracion(
      {required int idProgramacionJuego}) async {
    var params = {'idProgramacionJuego': '$idProgramacionJuego'};

    try {
      result = await api.getData('configuracion', params);
    } catch (e) {
      return null;
    }

    ConfiguracionDto? informeJuegoDto;

    if (result['isSuccess']) {
      informeJuegoDto = ConfiguracionDto.fromJson(result['data']);
    }

    return informeJuegoDto;
  }

  Future<int> insertConfiguracion(ConfiguracionDto configuracionDto) async {
    try {
      data = await api.postData('juegosconfiguracion',
          params: configuracionDto.toJson());
    } catch (e) {
      return 0;
    }
    if (data['isSuccess']) {
      ConfiguracionDto newConfiguracionDto =
          ConfiguracionDto.fromJson(data['data']);
      var newConfiguracion =
          ConfiguracionDto.toConfiguracion(newConfiguracionDto);
      return newConfiguracion.idConfiguracion;
    }
    return 0;
  }

  Future<bool> updateConfiguracion(ConfiguracionDto configuracionDto) async {
    try {
      data =
          await api.putData('juegosconfiguracion', configuracionDto.toJson());
    } catch (e) {
      return false;
    }
    if (data['isSuccess']) {
      return true;
    } else {
      return false;
    }
  }
}
