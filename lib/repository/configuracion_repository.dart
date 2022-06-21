import 'package:socio/utils/db/db_manager.dart';
import 'package:socio/providers/DTO/configuracion_dto.dart';
import 'package:socio/providers/api.dart';
import 'package:socio/utils/db/db_init.dart';

class ConfiguracionRepository {
  final Api api = Api();
  Map<String, dynamic> data = {};

  Future<Configuracion> selectConfiguracion(Configuracion configuracion) async {
    return db<AppDatabase>()
        .configuracionesDao
        .selectConfiguracion(configuracion);
  }

  Future<int> insertConfiguracion(Configuracion configuracion) async {
    ConfiguracionDto configuracionDto =
        ConfiguracionDto.fromConfiguracion(configuracion, idUsuario: 0);

    data = await api.postData('juegosconfiguracion',
        params: configuracionDto.toJson());

    if (data['isSuccess']) {
      ConfiguracionDto newConfiguracionDto =
          ConfiguracionDto.fromJson(data['data']);
      var newConfiguracion =
          ConfiguracionDto.toConfiguracion(newConfiguracionDto);
      await db<AppDatabase>()
          .configuracionesDao
          .insertConfiguracion(newConfiguracion);
      return newConfiguracion.idConfiguracion;
    }
    return 0;
  }

  Future<bool> updateConfiguracion(Configuracion configuracion) async {
    ConfiguracionDto configuracionDto =
        ConfiguracionDto.fromConfiguracion(configuracion, idUsuario: 0);
    try {
      data =
          await api.putData('juegosconfiguracion', configuracionDto.toJson());
    } catch (e) {
      return false;
    }
    if (data['isSuccess']) {
      await db<AppDatabase>()
          .configuracionesDao
          .updateConfiguracion(configuracion);
    }
    return true;
  }

  Future<int> deleteConfiguracion(Configuracion configuracion) async {
    return await db<AppDatabase>()
        .configuracionesDao
        .deleteConfiguracion(configuracion);
  }
}
