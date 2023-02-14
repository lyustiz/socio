import 'package:socio/providers/api.dart';
import 'package:socio/utils/db/db_manager.dart';
import 'package:socio/utils/db/json_serializer.dart';
import 'package:socio/utils/db/db_init.dart';

class JuegoRepository {
  final Api api = Api();
  Map<String, dynamic> data = {};

  Future<List<JuegosWithConfiguracion>> getAllJuegos(String terminado) async {
    try {
      data = await api.getData('juegosconfiguracion', {});
    } catch (e) {
      return [];
    }

    DateTime actualizado = DateTime.now();
    List<JuegosWithConfiguracion> juegosList = [];

    if (data['isSuccess']) {
      List dataJuegos = data['data'];
      for (var juegoJ in dataJuegos) {
        Juego juego;
        Configuracion? configuracion;

        juegoJ['actualizado'] = actualizado.toString();
        juego = Juego.fromJson(juegoJ, serializer: const JsonSerializer());

        if (juegoJ['configuracion'] != null) {
          if (juegoJ['configuracion']['idConfiguracion'] != 0) {
            configuracion = await getConfiguracion(
              juegoJ['configuracion'],
              juegoJ['idProgramacionJuego'],
              actualizado,
            );
          }
        }

        juegosList.add(JuegosWithConfiguracion(
          juego: juego,
          configuracion: configuracion,
        ));
      }
    }
    return juegosList;
  }

  Future<Configuracion> getConfiguracion(
    Map<String, dynamic> configuracionJson,
    int idProgramacionJuego,
    DateTime actualizado,
  ) async {
    configuracionJson['idProgramacionJuego'] = idProgramacionJuego;
    configuracionJson['idUsuario'] = configuracionJson['idUsuario'] ?? 0;
    configuracionJson['actualizado'] = actualizado.toString();
    return Configuracion.fromJson(configuracionJson,
        serializer: const JsonSerializer());
  }

  Future<Juego> selectJuego(Juego juego) async {
    return db<AppDatabase>().juegosDao.selectJuego(juego);
  }

  Future<List<Juego>> allJuegos(String terminado) async {
    var juegos = await db<AppDatabase>().juegosDao.allJuegos(terminado);
    return juegos;
  }

  Future<bool> upateJuego(Juego juego) async {
    return db<AppDatabase>().juegosDao.upateJuego(juego);
  }

  Future<int> insertJuego(Juego juego) async {
    return db<AppDatabase>().juegosDao.insertJuego(juego);
  }

  Future<int> deleteJuego(Juego juego) async {
    return db<AppDatabase>().juegosDao.deleteJuego(juego);
  }
}
